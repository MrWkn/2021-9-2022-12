#include <systemc>
#include <iostream>
#include <cstdlib>
#include <cstddef>
#include <stdint.h>
#include "SysCFileHandler.h"
#include "ap_int.h"
#include "ap_fixed.h"
#include <complex>
#include <stdbool.h>
#include "autopilot_cbe.h"
#include "hls_stream.h"
#include "hls_half.h"
#include "hls_signal_handler.h"

using namespace std;
using namespace sc_core;
using namespace sc_dt;

// wrapc file define:
#define AUTOTB_TVIN_gmem "../tv/cdatafile/c.send.autotvin_gmem.dat"
#define AUTOTB_TVOUT_gmem "../tv/cdatafile/c.send.autotvout_gmem.dat"
// wrapc file define:
#define AUTOTB_TVIN_data_ptr "../tv/cdatafile/c.send.autotvin_data_ptr.dat"
#define AUTOTB_TVOUT_data_ptr "../tv/cdatafile/c.send.autotvout_data_ptr.dat"
// wrapc file define:
#define AUTOTB_TVIN_data "../tv/cdatafile/c.send.autotvin_data.dat"
#define AUTOTB_TVOUT_data "../tv/cdatafile/c.send.autotvout_data.dat"
// wrapc file define:
#define AUTOTB_TVIN_req "../tv/cdatafile/c.send.autotvin_req.dat"
#define AUTOTB_TVOUT_req "../tv/cdatafile/c.send.autotvout_req.dat"
// wrapc file define:
#define AUTOTB_TVIN_ack "../tv/cdatafile/c.send.autotvin_ack.dat"
#define AUTOTB_TVOUT_ack "../tv/cdatafile/c.send.autotvout_ack.dat"
// wrapc file define:
#define AUTOTB_TVIN_read_loc "../tv/cdatafile/c.send.autotvin_read_loc.dat"
#define AUTOTB_TVOUT_read_loc "../tv/cdatafile/c.send.autotvout_read_loc.dat"
// wrapc file define:
#define AUTOTB_TVIN_SCHED_FULL "../tv/cdatafile/c.send.autotvin_SCHED_FULL.dat"
#define AUTOTB_TVOUT_SCHED_FULL "../tv/cdatafile/c.send.autotvout_SCHED_FULL.dat"
// wrapc file define:
#define AUTOTB_TVIN_NEUR_EVENT_OUT "../tv/cdatafile/c.send.autotvin_NEUR_EVENT_OUT.dat"
#define AUTOTB_TVOUT_NEUR_EVENT_OUT "../tv/cdatafile/c.send.autotvout_NEUR_EVENT_OUT.dat"
// wrapc file define:
#define AUTOTB_TVOUT_return "../tv/cdatafile/c.send.autotvout_ap_return.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_gmem "../tv/rtldatafile/rtl.send.autotvout_gmem.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_data_ptr "../tv/rtldatafile/rtl.send.autotvout_data_ptr.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_data "../tv/rtldatafile/rtl.send.autotvout_data.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_req "../tv/rtldatafile/rtl.send.autotvout_req.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_ack "../tv/rtldatafile/rtl.send.autotvout_ack.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_read_loc "../tv/rtldatafile/rtl.send.autotvout_read_loc.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_SCHED_FULL "../tv/rtldatafile/rtl.send.autotvout_SCHED_FULL.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_NEUR_EVENT_OUT "../tv/rtldatafile/rtl.send.autotvout_NEUR_EVENT_OUT.dat"
#define AUTOTB_TVOUT_PC_return "../tv/rtldatafile/rtl.send.autotvout_ap_return.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  gmem_depth = 0;
  data_ptr_depth = 0;
  data_depth = 0;
  req_depth = 0;
  ack_depth = 0;
  read_loc_depth = 0;
  SCHED_FULL_depth = 0;
  NEUR_EVENT_OUT_depth = 0;
  return_depth = 0;
  trans_num =0;
}
~INTER_TCL_FILE() {
  mFile.open(mName);
  if (!mFile.good()) {
    cout << "Failed to open file ref.tcl" << endl;
    exit (1); 
  }
  string total_list = get_depth_list();
  mFile << "set depth_list {\n";
  mFile << total_list;
  mFile << "}\n";
  mFile << "set trans_num "<<trans_num<<endl;
  mFile.close();
}
string get_depth_list () {
  stringstream total_list;
  total_list << "{gmem " << gmem_depth << "}\n";
  total_list << "{data_ptr " << data_ptr_depth << "}\n";
  total_list << "{data " << data_depth << "}\n";
  total_list << "{req " << req_depth << "}\n";
  total_list << "{ack " << ack_depth << "}\n";
  total_list << "{read_loc " << read_loc_depth << "}\n";
  total_list << "{SCHED_FULL " << SCHED_FULL_depth << "}\n";
  total_list << "{NEUR_EVENT_OUT " << NEUR_EVENT_OUT_depth << "}\n";
  total_list << "{ap_return " << return_depth << "}\n";
  return total_list.str();
}
void set_num (int num , int* class_num) {
  (*class_num) = (*class_num) > num ? (*class_num) : num;
}
void set_string(std::string list, std::string* class_list) {
  (*class_list) = list;
}
  public:
    int gmem_depth;
    int data_ptr_depth;
    int data_depth;
    int req_depth;
    int ack_depth;
    int read_loc_depth;
    int SCHED_FULL_depth;
    int NEUR_EVENT_OUT_depth;
    int return_depth;
    int trans_num;
  private:
    ofstream mFile;
    const char* mName;
};

static void RTLOutputCheckAndReplacement(std::string &AESL_token, std::string PortName) {
  bool no_x = false;
  bool err = false;

  no_x = false;
  // search and replace 'X' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('X', 0);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'X' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
  no_x = false;
  // search and replace 'x' with '0' from the 3rd char of token
  while (!no_x) {
    size_t x_found = AESL_token.find('x', 2);
    if (x_found != string::npos) {
      if (!err) { 
        cerr << "WARNING: [SIM 212-201] RTL produces unknown value 'x' on port" 
             << PortName << ", possible cause: There are uninitialized variables in the C design."
             << endl; 
        err = true;
      }
      AESL_token.replace(x_found, 1, "0");
    } else
      no_x = true;
  }
}
extern "C" int send_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, int, volatile void *, volatile void *);

extern "C" int apatb_send_hw(volatile void * __xlx_apatb_param_data_ptr, volatile void * __xlx_apatb_param_data, volatile void * __xlx_apatb_param_req, volatile void * __xlx_apatb_param_ack, int __xlx_apatb_param_read_loc, volatile void * __xlx_apatb_param_SCHED_FULL, volatile void * __xlx_apatb_param_NEUR_EVENT_OUT) {
  refine_signal_handler();
  fstream wrapc_switch_file_token;
  wrapc_switch_file_token.open(".hls_cosim_wrapc_switch.log");
  int AESL_i;
  if (wrapc_switch_file_token.good())
  {

    CodeState = ENTER_WRAPC_PC;
    static unsigned AESL_transaction_pc = 0;
    string AESL_token;
    string AESL_num;
    int AESL_return;
    {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_return);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > return_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "return");
  
            // push token into output port buffer
            if (AESL_token != "") {
              return_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)&AESL_return)[0*4+0] = return_pc_buffer[0].range(7, 0).to_int64();
((char*)&AESL_return)[0*4+1] = return_pc_buffer[0].range(15, 8).to_int64();
((char*)&AESL_return)[0*4+2] = return_pc_buffer[0].range(23, 16).to_int64();
((char*)&AESL_return)[0*4+3] = return_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_data);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > data_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "data");
  
            // push token into output port buffer
            if (AESL_token != "") {
              data_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_data)[0*4+0] = data_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_data)[0*4+1] = data_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_data)[0*4+2] = data_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_data)[0*4+3] = data_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_req);
        if (rtl_tv_out_file.good()) {
          rtl_tv_out_file >> AESL_token;
          if (AESL_token != "[[[runtime]]]")
            exit(1);
        }
      }
  
      if (rtl_tv_out_file.good()) {
        rtl_tv_out_file >> AESL_token; 
        rtl_tv_out_file >> AESL_num;  // transaction number
        if (AESL_token != "[[transaction]]") {
          cerr << "Unexpected token: " << AESL_token << endl;
          exit(1);
        }
        if (atoi(AESL_num.c_str()) == AESL_transaction_pc) {
          std::vector<sc_bv<32> > req_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "req");
  
            // push token into output port buffer
            if (AESL_token != "") {
              req_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_req)[0*4+0] = req_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_req)[0*4+1] = req_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_req)[0*4+2] = req_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_req)[0*4+3] = req_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  
    AESL_transaction_pc++;
    return  AESL_return;
  }
static unsigned AESL_transaction;
static AESL_FILE_HANDLER aesl_fh;
static INTER_TCL_FILE tcl_file(INTER_TCL);
std::vector<char> __xlx_sprintf_buffer(1024);
CodeState = ENTER_WRAPC;
//gmem
aesl_fh.touch(AUTOTB_TVIN_gmem);
aesl_fh.touch(AUTOTB_TVOUT_gmem);
//data_ptr
aesl_fh.touch(AUTOTB_TVIN_data_ptr);
aesl_fh.touch(AUTOTB_TVOUT_data_ptr);
//data
aesl_fh.touch(AUTOTB_TVIN_data);
aesl_fh.touch(AUTOTB_TVOUT_data);
//req
aesl_fh.touch(AUTOTB_TVIN_req);
aesl_fh.touch(AUTOTB_TVOUT_req);
//ack
aesl_fh.touch(AUTOTB_TVIN_ack);
aesl_fh.touch(AUTOTB_TVOUT_ack);
//read_loc
aesl_fh.touch(AUTOTB_TVIN_read_loc);
aesl_fh.touch(AUTOTB_TVOUT_read_loc);
//SCHED_FULL
aesl_fh.touch(AUTOTB_TVIN_SCHED_FULL);
aesl_fh.touch(AUTOTB_TVOUT_SCHED_FULL);
//NEUR_EVENT_OUT
aesl_fh.touch(AUTOTB_TVIN_NEUR_EVENT_OUT);
aesl_fh.touch(AUTOTB_TVOUT_NEUR_EVENT_OUT);
CodeState = DUMP_INPUTS;
unsigned __xlx_offset_byte_param_data_ptr = 0;
// print gmem Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
  {  __xlx_offset_byte_param_data_ptr = 0*4;
  if (__xlx_apatb_param_data_ptr) {
    for (int j = 0  - 0, e = 100 - 0; j != e; ++j) {
sc_bv<32> __xlx_tmp_lv = ((int*)__xlx_apatb_param_data_ptr)[j];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_gmem, s.append("\n")); 
      }
  }
}
  tcl_file.set_num(100, &tcl_file.gmem_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_gmem, __xlx_sprintf_buffer.data());
}
// print data_ptr Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_data_ptr, __xlx_sprintf_buffer.data());
  {
    sc_bv<64> __xlx_tmp_lv = __xlx_offset_byte_param_data_ptr;

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_data_ptr, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.data_ptr_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_data_ptr, __xlx_sprintf_buffer.data());
}
// print data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_data, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_data);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_data, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_data, __xlx_sprintf_buffer.data());
}
// print req Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_req, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_req);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_req, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.req_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_req, __xlx_sprintf_buffer.data());
}
// print ack Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_ack, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_ack);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_ack, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.ack_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_ack, __xlx_sprintf_buffer.data());
}
// print read_loc Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_read_loc, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)&__xlx_apatb_param_read_loc);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_read_loc, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.read_loc_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_read_loc, __xlx_sprintf_buffer.data());
}
// print SCHED_FULL Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_SCHED_FULL, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_SCHED_FULL);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_SCHED_FULL, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.SCHED_FULL_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_SCHED_FULL, __xlx_sprintf_buffer.data());
}
// print NEUR_EVENT_OUT Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_NEUR_EVENT_OUT, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_NEUR_EVENT_OUT);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_NEUR_EVENT_OUT, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.NEUR_EVENT_OUT_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_NEUR_EVENT_OUT, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
int ap_return = send_hw_stub_wrapper(__xlx_apatb_param_data_ptr, __xlx_apatb_param_data, __xlx_apatb_param_req, __xlx_apatb_param_ack, __xlx_apatb_param_read_loc, __xlx_apatb_param_SCHED_FULL, __xlx_apatb_param_NEUR_EVENT_OUT);
CodeState = DUMP_OUTPUTS;
// print data Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_data, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_data);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_data, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.data_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_data, __xlx_sprintf_buffer.data());
}
// print req Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_req, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_req);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_req, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.req_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_req, __xlx_sprintf_buffer.data());
}
// print return Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_return, __xlx_sprintf_buffer.data());
  sc_bv<32> __xlx_tmp_lv = ((int*)&ap_return)[0];

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_return, s.append("\n")); 
  
  tcl_file.set_num(1, &tcl_file.return_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_return, __xlx_sprintf_buffer.data());
}
CodeState = DELETE_CHAR_BUFFERS;
AESL_transaction++;
tcl_file.set_num(AESL_transaction , &tcl_file.trans_num);
return ap_return;
}
