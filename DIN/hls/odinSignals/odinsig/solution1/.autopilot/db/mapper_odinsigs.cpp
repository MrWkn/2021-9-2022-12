#include <systemc>
#include <vector>
#include <iostream>
#include "hls_stream.h"
#include "ap_int.h"
#include "ap_fixed.h"
using namespace std;
using namespace sc_dt;
class AESL_RUNTIME_BC {
  public:
    AESL_RUNTIME_BC(const char* name) {
      file_token.open( name);
      if (!file_token.good()) {
        cout << "Failed to open tv file " << name << endl;
        exit (1);
      }
      file_token >> mName;//[[[runtime]]]
    }
    ~AESL_RUNTIME_BC() {
      file_token.close();
    }
    int read_size () {
      int size = 0;
      file_token >> mName;//[[transaction]]
      file_token >> mName;//transaction number
      file_token >> mName;//pop_size
      size = atoi(mName.c_str());
      file_token >> mName;//[[/transaction]]
      return size;
    }
  public:
    fstream file_token;
    string mName;
};
extern "C" int odinsigs(volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *, volatile void *);
extern "C" int apatb_odinsigs_hw(volatile void * __xlx_apatb_param_addr_o, volatile void * __xlx_apatb_param_req_o, volatile void * __xlx_apatb_param_ack_o, volatile void * __xlx_apatb_param_AEROUT_ADDR, volatile void * __xlx_apatb_param_AEROUT_REQ, volatile void * __xlx_apatb_param_AEROUT_ACK, volatile void * __xlx_apatb_param_writeloc, volatile void * __xlx_apatb_param_pop_n, volatile void * __xlx_apatb_param_postneuron, volatile void * __xlx_apatb_param_CTRL_SCHED_POP_N, volatile void * __xlx_apatb_param_CTRL_NEURMEM_ADDR, volatile void * __xlx_apatb_param_AEROUT_CTRL_BUSY) {
  // DUT call
  int ap_return = odinsigs(__xlx_apatb_param_addr_o, __xlx_apatb_param_req_o, __xlx_apatb_param_ack_o, __xlx_apatb_param_AEROUT_ADDR, __xlx_apatb_param_AEROUT_REQ, __xlx_apatb_param_AEROUT_ACK, __xlx_apatb_param_writeloc, __xlx_apatb_param_pop_n, __xlx_apatb_param_postneuron, __xlx_apatb_param_CTRL_SCHED_POP_N, __xlx_apatb_param_CTRL_NEURMEM_ADDR, __xlx_apatb_param_AEROUT_CTRL_BUSY);
return ap_return;
}
