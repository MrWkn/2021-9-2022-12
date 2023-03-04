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
#define AUTOTB_TVIN_addr_o "../tv/cdatafile/c.odinsigs.autotvin_addr_o.dat"
#define AUTOTB_TVOUT_addr_o "../tv/cdatafile/c.odinsigs.autotvout_addr_o.dat"
// wrapc file define:
#define AUTOTB_TVIN_req_o "../tv/cdatafile/c.odinsigs.autotvin_req_o.dat"
#define AUTOTB_TVOUT_req_o "../tv/cdatafile/c.odinsigs.autotvout_req_o.dat"
// wrapc file define:
#define AUTOTB_TVIN_ack_o "../tv/cdatafile/c.odinsigs.autotvin_ack_o.dat"
#define AUTOTB_TVOUT_ack_o "../tv/cdatafile/c.odinsigs.autotvout_ack_o.dat"
// wrapc file define:
#define AUTOTB_TVIN_AEROUT_ADDR "../tv/cdatafile/c.odinsigs.autotvin_AEROUT_ADDR.dat"
#define AUTOTB_TVOUT_AEROUT_ADDR "../tv/cdatafile/c.odinsigs.autotvout_AEROUT_ADDR.dat"
// wrapc file define:
#define AUTOTB_TVIN_AEROUT_REQ "../tv/cdatafile/c.odinsigs.autotvin_AEROUT_REQ.dat"
#define AUTOTB_TVOUT_AEROUT_REQ "../tv/cdatafile/c.odinsigs.autotvout_AEROUT_REQ.dat"
// wrapc file define:
#define AUTOTB_TVIN_AEROUT_ACK "../tv/cdatafile/c.odinsigs.autotvin_AEROUT_ACK.dat"
#define AUTOTB_TVOUT_AEROUT_ACK "../tv/cdatafile/c.odinsigs.autotvout_AEROUT_ACK.dat"
// wrapc file define:
#define AUTOTB_TVIN_writeloc "../tv/cdatafile/c.odinsigs.autotvin_writeloc.dat"
#define AUTOTB_TVOUT_writeloc "../tv/cdatafile/c.odinsigs.autotvout_writeloc.dat"
// wrapc file define:
#define AUTOTB_TVIN_pop_n "../tv/cdatafile/c.odinsigs.autotvin_pop_n.dat"
#define AUTOTB_TVOUT_pop_n "../tv/cdatafile/c.odinsigs.autotvout_pop_n.dat"
// wrapc file define:
#define AUTOTB_TVIN_postneuron "../tv/cdatafile/c.odinsigs.autotvin_postneuron.dat"
#define AUTOTB_TVOUT_postneuron "../tv/cdatafile/c.odinsigs.autotvout_postneuron.dat"
// wrapc file define:
#define AUTOTB_TVIN_CTRL_SCHED_POP_N "../tv/cdatafile/c.odinsigs.autotvin_CTRL_SCHED_POP_N.dat"
#define AUTOTB_TVOUT_CTRL_SCHED_POP_N "../tv/cdatafile/c.odinsigs.autotvout_CTRL_SCHED_POP_N.dat"
// wrapc file define:
#define AUTOTB_TVIN_CTRL_NEURMEM_ADDR "../tv/cdatafile/c.odinsigs.autotvin_CTRL_NEURMEM_ADDR.dat"
#define AUTOTB_TVOUT_CTRL_NEURMEM_ADDR "../tv/cdatafile/c.odinsigs.autotvout_CTRL_NEURMEM_ADDR.dat"
// wrapc file define:
#define AUTOTB_TVIN_AEROUT_CTRL_BUSY "../tv/cdatafile/c.odinsigs.autotvin_AEROUT_CTRL_BUSY.dat"
#define AUTOTB_TVOUT_AEROUT_CTRL_BUSY "../tv/cdatafile/c.odinsigs.autotvout_AEROUT_CTRL_BUSY.dat"
// wrapc file define:
#define AUTOTB_TVOUT_return "../tv/cdatafile/c.odinsigs.autotvout_ap_return.dat"

#define INTER_TCL "../tv/cdatafile/ref.tcl"

// tvout file define:
#define AUTOTB_TVOUT_PC_addr_o "../tv/rtldatafile/rtl.odinsigs.autotvout_addr_o.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_req_o "../tv/rtldatafile/rtl.odinsigs.autotvout_req_o.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_ack_o "../tv/rtldatafile/rtl.odinsigs.autotvout_ack_o.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_AEROUT_ADDR "../tv/rtldatafile/rtl.odinsigs.autotvout_AEROUT_ADDR.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_AEROUT_REQ "../tv/rtldatafile/rtl.odinsigs.autotvout_AEROUT_REQ.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_AEROUT_ACK "../tv/rtldatafile/rtl.odinsigs.autotvout_AEROUT_ACK.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_writeloc "../tv/rtldatafile/rtl.odinsigs.autotvout_writeloc.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_pop_n "../tv/rtldatafile/rtl.odinsigs.autotvout_pop_n.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_postneuron "../tv/rtldatafile/rtl.odinsigs.autotvout_postneuron.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_CTRL_SCHED_POP_N "../tv/rtldatafile/rtl.odinsigs.autotvout_CTRL_SCHED_POP_N.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_CTRL_NEURMEM_ADDR "../tv/rtldatafile/rtl.odinsigs.autotvout_CTRL_NEURMEM_ADDR.dat"
// tvout file define:
#define AUTOTB_TVOUT_PC_AEROUT_CTRL_BUSY "../tv/rtldatafile/rtl.odinsigs.autotvout_AEROUT_CTRL_BUSY.dat"
#define AUTOTB_TVOUT_PC_return "../tv/rtldatafile/rtl.odinsigs.autotvout_ap_return.dat"

class INTER_TCL_FILE {
  public:
INTER_TCL_FILE(const char* name) {
  mName = name; 
  addr_o_depth = 0;
  req_o_depth = 0;
  ack_o_depth = 0;
  AEROUT_ADDR_depth = 0;
  AEROUT_REQ_depth = 0;
  AEROUT_ACK_depth = 0;
  writeloc_depth = 0;
  pop_n_depth = 0;
  postneuron_depth = 0;
  CTRL_SCHED_POP_N_depth = 0;
  CTRL_NEURMEM_ADDR_depth = 0;
  AEROUT_CTRL_BUSY_depth = 0;
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
  total_list << "{addr_o " << addr_o_depth << "}\n";
  total_list << "{req_o " << req_o_depth << "}\n";
  total_list << "{ack_o " << ack_o_depth << "}\n";
  total_list << "{AEROUT_ADDR " << AEROUT_ADDR_depth << "}\n";
  total_list << "{AEROUT_REQ " << AEROUT_REQ_depth << "}\n";
  total_list << "{AEROUT_ACK " << AEROUT_ACK_depth << "}\n";
  total_list << "{writeloc " << writeloc_depth << "}\n";
  total_list << "{pop_n " << pop_n_depth << "}\n";
  total_list << "{postneuron " << postneuron_depth << "}\n";
  total_list << "{CTRL_SCHED_POP_N " << CTRL_SCHED_POP_N_depth << "}\n";
  total_list << "{CTRL_NEURMEM_ADDR " << CTRL_NEURMEM_ADDR_depth << "}\n";
  total_list << "{AEROUT_CTRL_BUSY " << AEROUT_CTRL_BUSY_depth << "}\n";
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
    int addr_o_depth;
    int req_o_depth;
    int ack_o_depth;
    int AEROUT_ADDR_depth;
    int AEROUT_REQ_depth;
    int AEROUT_ACK_depth;
    int writeloc_depth;
    int pop_n_depth;
    int postneuron_depth;
    int CTRL_SCHED_POP_N_depth;
    int CTRL_NEURMEM_ADDR_depth;
    int AEROUT_CTRL_BUSY_depth;
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
extern "C" int odinsigs_hw_stub_wrapper(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);

extern "C" int apatb_odinsigs_hw(volatile void * __xlx_apatb_param_addr_o, volatile void * __xlx_apatb_param_req_o, volatile void * __xlx_apatb_param_ack_o, volatile void * __xlx_apatb_param_AEROUT_ADDR, volatile void * __xlx_apatb_param_AEROUT_REQ, volatile void * __xlx_apatb_param_AEROUT_ACK, volatile void * __xlx_apatb_param_writeloc, volatile void * __xlx_apatb_param_pop_n, volatile void * __xlx_apatb_param_postneuron, volatile void * __xlx_apatb_param_CTRL_SCHED_POP_N, volatile void * __xlx_apatb_param_CTRL_NEURMEM_ADDR, volatile void * __xlx_apatb_param_AEROUT_CTRL_BUSY) {
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
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_addr_o);
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
          std::vector<sc_bv<32> > addr_o_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "addr_o");
  
            // push token into output port buffer
            if (AESL_token != "") {
              addr_o_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_addr_o)[0*4+0] = addr_o_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_addr_o)[0*4+1] = addr_o_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_addr_o)[0*4+2] = addr_o_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_addr_o)[0*4+3] = addr_o_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_req_o);
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
          std::vector<sc_bv<32> > req_o_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "req_o");
  
            // push token into output port buffer
            if (AESL_token != "") {
              req_o_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_req_o)[0*4+0] = req_o_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_req_o)[0*4+1] = req_o_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_req_o)[0*4+2] = req_o_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_req_o)[0*4+3] = req_o_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_AEROUT_ACK);
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
          std::vector<sc_bv<32> > AEROUT_ACK_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "AEROUT_ACK");
  
            // push token into output port buffer
            if (AESL_token != "") {
              AEROUT_ACK_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_AEROUT_ACK)[0*4+0] = AEROUT_ACK_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_AEROUT_ACK)[0*4+1] = AEROUT_ACK_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_AEROUT_ACK)[0*4+2] = AEROUT_ACK_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_AEROUT_ACK)[0*4+3] = AEROUT_ACK_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_pop_n);
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
          std::vector<sc_bv<32> > pop_n_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "pop_n");
  
            // push token into output port buffer
            if (AESL_token != "") {
              pop_n_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_pop_n)[0*4+0] = pop_n_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_pop_n)[0*4+1] = pop_n_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_pop_n)[0*4+2] = pop_n_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_pop_n)[0*4+3] = pop_n_pc_buffer[0].range(31, 24).to_int64();
}
        } // end transaction
      } // end file is good
    } // end post check logic bolck
  {
      static ifstream rtl_tv_out_file;
      if (!rtl_tv_out_file.is_open()) {
        rtl_tv_out_file.open(AUTOTB_TVOUT_PC_postneuron);
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
          std::vector<sc_bv<32> > postneuron_pc_buffer(1);
          int i = 0;

          rtl_tv_out_file >> AESL_token; //data
          while (AESL_token != "[[/transaction]]"){

            RTLOutputCheckAndReplacement(AESL_token, "postneuron");
  
            // push token into output port buffer
            if (AESL_token != "") {
              postneuron_pc_buffer[i] = AESL_token.c_str();;
              i++;
            }
  
            rtl_tv_out_file >> AESL_token; //data or [[/transaction]]
            if (AESL_token == "[[[/runtime]]]" || rtl_tv_out_file.eof())
              exit(1);
          }
          if (i > 0) {((char*)__xlx_apatb_param_postneuron)[0*4+0] = postneuron_pc_buffer[0].range(7, 0).to_int64();
((char*)__xlx_apatb_param_postneuron)[0*4+1] = postneuron_pc_buffer[0].range(15, 8).to_int64();
((char*)__xlx_apatb_param_postneuron)[0*4+2] = postneuron_pc_buffer[0].range(23, 16).to_int64();
((char*)__xlx_apatb_param_postneuron)[0*4+3] = postneuron_pc_buffer[0].range(31, 24).to_int64();
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
//addr_o
aesl_fh.touch(AUTOTB_TVIN_addr_o);
aesl_fh.touch(AUTOTB_TVOUT_addr_o);
//req_o
aesl_fh.touch(AUTOTB_TVIN_req_o);
aesl_fh.touch(AUTOTB_TVOUT_req_o);
//ack_o
aesl_fh.touch(AUTOTB_TVIN_ack_o);
aesl_fh.touch(AUTOTB_TVOUT_ack_o);
//AEROUT_ADDR
aesl_fh.touch(AUTOTB_TVIN_AEROUT_ADDR);
aesl_fh.touch(AUTOTB_TVOUT_AEROUT_ADDR);
//AEROUT_REQ
aesl_fh.touch(AUTOTB_TVIN_AEROUT_REQ);
aesl_fh.touch(AUTOTB_TVOUT_AEROUT_REQ);
//AEROUT_ACK
aesl_fh.touch(AUTOTB_TVIN_AEROUT_ACK);
aesl_fh.touch(AUTOTB_TVOUT_AEROUT_ACK);
//writeloc
aesl_fh.touch(AUTOTB_TVIN_writeloc);
aesl_fh.touch(AUTOTB_TVOUT_writeloc);
//pop_n
aesl_fh.touch(AUTOTB_TVIN_pop_n);
aesl_fh.touch(AUTOTB_TVOUT_pop_n);
//postneuron
aesl_fh.touch(AUTOTB_TVIN_postneuron);
aesl_fh.touch(AUTOTB_TVOUT_postneuron);
//CTRL_SCHED_POP_N
aesl_fh.touch(AUTOTB_TVIN_CTRL_SCHED_POP_N);
aesl_fh.touch(AUTOTB_TVOUT_CTRL_SCHED_POP_N);
//CTRL_NEURMEM_ADDR
aesl_fh.touch(AUTOTB_TVIN_CTRL_NEURMEM_ADDR);
aesl_fh.touch(AUTOTB_TVOUT_CTRL_NEURMEM_ADDR);
//AEROUT_CTRL_BUSY
aesl_fh.touch(AUTOTB_TVIN_AEROUT_CTRL_BUSY);
aesl_fh.touch(AUTOTB_TVOUT_AEROUT_CTRL_BUSY);
CodeState = DUMP_INPUTS;
// print addr_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_addr_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_addr_o);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_addr_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.addr_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_addr_o, __xlx_sprintf_buffer.data());
}
// print req_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_req_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_req_o);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_req_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.req_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_req_o, __xlx_sprintf_buffer.data());
}
// print ack_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_ack_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_ack_o);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_ack_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.ack_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_ack_o, __xlx_sprintf_buffer.data());
}
// print AEROUT_ADDR Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_AEROUT_ADDR, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_AEROUT_ADDR);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_AEROUT_ADDR, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.AEROUT_ADDR_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_AEROUT_ADDR, __xlx_sprintf_buffer.data());
}
// print AEROUT_REQ Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_AEROUT_REQ, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_AEROUT_REQ);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_AEROUT_REQ, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.AEROUT_REQ_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_AEROUT_REQ, __xlx_sprintf_buffer.data());
}
// print AEROUT_ACK Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_AEROUT_ACK, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_AEROUT_ACK);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_AEROUT_ACK, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.AEROUT_ACK_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_AEROUT_ACK, __xlx_sprintf_buffer.data());
}
// print writeloc Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_writeloc, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_writeloc);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_writeloc, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.writeloc_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_writeloc, __xlx_sprintf_buffer.data());
}
// print pop_n Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_pop_n, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_pop_n);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_pop_n, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.pop_n_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_pop_n, __xlx_sprintf_buffer.data());
}
// print postneuron Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_postneuron, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_postneuron);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_postneuron, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.postneuron_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_postneuron, __xlx_sprintf_buffer.data());
}
// print CTRL_SCHED_POP_N Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_CTRL_SCHED_POP_N, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_CTRL_SCHED_POP_N);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_CTRL_SCHED_POP_N, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.CTRL_SCHED_POP_N_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_CTRL_SCHED_POP_N, __xlx_sprintf_buffer.data());
}
// print CTRL_NEURMEM_ADDR Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_CTRL_NEURMEM_ADDR, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_CTRL_NEURMEM_ADDR);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_CTRL_NEURMEM_ADDR, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.CTRL_NEURMEM_ADDR_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_CTRL_NEURMEM_ADDR, __xlx_sprintf_buffer.data());
}
// print AEROUT_CTRL_BUSY Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVIN_AEROUT_CTRL_BUSY, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_AEROUT_CTRL_BUSY);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVIN_AEROUT_CTRL_BUSY, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.AEROUT_CTRL_BUSY_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVIN_AEROUT_CTRL_BUSY, __xlx_sprintf_buffer.data());
}
CodeState = CALL_C_DUT;
int ap_return = odinsigs_hw_stub_wrapper(__xlx_apatb_param_addr_o, __xlx_apatb_param_req_o, __xlx_apatb_param_ack_o, __xlx_apatb_param_AEROUT_ADDR, __xlx_apatb_param_AEROUT_REQ, __xlx_apatb_param_AEROUT_ACK, __xlx_apatb_param_writeloc, __xlx_apatb_param_pop_n, __xlx_apatb_param_postneuron, __xlx_apatb_param_CTRL_SCHED_POP_N, __xlx_apatb_param_CTRL_NEURMEM_ADDR, __xlx_apatb_param_AEROUT_CTRL_BUSY);
CodeState = DUMP_OUTPUTS;
// print addr_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_addr_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_addr_o);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_addr_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.addr_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_addr_o, __xlx_sprintf_buffer.data());
}
// print req_o Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_req_o, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_req_o);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_req_o, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.req_o_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_req_o, __xlx_sprintf_buffer.data());
}
// print AEROUT_ACK Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_AEROUT_ACK, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_AEROUT_ACK);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_AEROUT_ACK, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.AEROUT_ACK_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_AEROUT_ACK, __xlx_sprintf_buffer.data());
}
// print pop_n Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_pop_n, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_pop_n);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_pop_n, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.pop_n_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_pop_n, __xlx_sprintf_buffer.data());
}
// print postneuron Transactions
{
  sprintf(__xlx_sprintf_buffer.data(), "[[transaction]] %d\n", AESL_transaction);
  aesl_fh.write(AUTOTB_TVOUT_postneuron, __xlx_sprintf_buffer.data());
  {
    sc_bv<32> __xlx_tmp_lv = *((int*)__xlx_apatb_param_postneuron);

    std::string s(__xlx_tmp_lv.to_string(SC_HEX));
    aesl_fh.write(AUTOTB_TVOUT_postneuron, s.append("\n")); 
  }
  tcl_file.set_num(1, &tcl_file.postneuron_depth);
  sprintf(__xlx_sprintf_buffer.data(), "[[/transaction]] \n");
  aesl_fh.write(AUTOTB_TVOUT_postneuron, __xlx_sprintf_buffer.data());
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
