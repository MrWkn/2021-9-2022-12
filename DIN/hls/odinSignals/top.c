int odinsigs(volatile int *addr_o,
			 volatile int *req_o,
			 volatile int *ack_o,
			 volatile int *AEROUT_ADDR,
			 volatile int *AEROUT_REQ,
			 volatile int *AEROUT_ACK,
			 volatile int *writeloc,
			 volatile int *pop_n,
			 volatile int *postneuron,

			 volatile int *CTRL_SCHED_POP_N,
			 volatile int *CTRL_NEURMEM_ADDR,
			 volatile int *AEROUT_CTRL_BUSY){

#pragma HLS INTERFACE mode=s_axilite port=addr_o register
#pragma HLS INTERFACE mode=s_axilite port=req_o register
#pragma HLS INTERFACE mode=s_axilite port=ack_o register
#pragma HLS INTERFACE mode=s_axilite port=postneuron register
#pragma HLS INTERFACE mode=s_axilite port=pop_n register
#pragma HLS INTERFACE mode=s_axilite port=writeloc register
#pragma HLS INTERFACE mode=s_axilite port=return register

#pragma HLS INTERFACE mode=ap_none port=AEROUT_ADDR register
#pragma HLS INTERFACE mode=ap_none port=AEROUT_REQ register
#pragma HLS INTERFACE mode=ap_none port=AEROUT_ACK register
#pragma HLS INTERFACE mode=ap_none port=CTRL_NEURMEM_ADDR register
#pragma HLS INTERFACE mode=ap_none port=CTRL_SCHED_POP_N register
#pragma HLS INTERFACE mode=ap_none port=AEROUT_CTRL_BUSY register

	*addr_o=*AEROUT_ADDR;
	*req_o=*AEROUT_REQ;
	*AEROUT_ACK=*ack_o;
	*pop_n=*CTRL_SCHED_POP_N;
	*postneuron=*CTRL_NEURMEM_ADDR;
	return 1; //return=1 means done
}

/*
 * 指针变量和变量有什么区别？
 * ap_none只能显示端口,不能生成驱动函数,因此需要额外声明一些个变量用于生成驱动函数,在sdk调用；
 * 注意：
 * 		如果这样写：volatile int req_o, 那么在sdk中虽然有get函数，但是无效，读取不到
 * 		很早一篇ddr的文章写道：HLS（C语言）标量参数是只读的，综合之后，在HDL语言里面肯定只是input；而不是inout
 * */
/*
	if(*CTRL_SCHED_POP_N==0)  //直到处理完256个突触后神经元才可以退出循环
		break;
	if(*AEROUT_CTRL_BUSY==0)
		break;
	上面这两种判断哪一个好一点：
	A.是在ip中必须处理完all the events fired by the post neurons
	B.是每次在ip中仅仅处理one event fired by the post neuron
	这里我们先选A哈
 * */


/*A
 * while(1){
		//1.odin发起 req=1; ip接收数据  同时返回ack=1:
		if(*AEROUT_REQ==1){
			addr_o[writeloc]=*AEROUT_ADDR;
			//这里会不会存在多次检测req=1  进而导致writeloc多次增加呢
			writeloc=writeloc+1;
			*AEROUT_ACK=1;
		//2.odin重置  req=0; ip返回ack=0:
		}else{
			*AEROUT_ACK=0;
			if(*CTRL_NEURMEM_ADDR==255)  //直到处理完256个突触后神经元才可以退出循环
				break;
		}
	}


	B.
	while(*AEROUT_CTRL_BUSY==1){
			//如果是neuron event，后神经元没有激发脉冲时=0    fire一个事件时从发起请求到接收前都是1
			if(*AEROUT_REQ==1){//1.odin发起 req=1; ip接收数据  同时返回ack=1:
				addr_o[writeloc]=*AEROUT_ADDR;
				*AEROUT_ACK=1;
			}else{
				*AEROUT_ACK=0;
			}
		}


	C.
	*pop_n=*CTRL_SCHED_POP_N; //要在sdk中检测  CTRL_SCHED_POP_N的值是不是变为0
	*req_o=*AEROUT_REQ;   //sdk中可以检测到
	*addr_o=*AEROUT_ADDR; //sdk中可以检测到
	*AEROUT_ACK=*ack_o;   //sdk中可以设置到set之后才可以start

	d.好像是start一次,只检测一次
	while(CTRL_NEURMEM_ADDR<250){
		if((AEROUT_REQ==0)&&(ack==0)){
			continue;
		}else if((AEROUT_REQ==1)&&(ack==0)){
			addr_o[writeloc]=*AEROUT_ADDR;
			//这里会不会存在多次检测req=1  进而导致writeloc多次增加呢
			writeloc=writeloc+1;
			*AEROUT_ACK=1;
			ack=1;
		}else if((AEROUT_REQ==0)&&(ack==1)){
			*AEROUT_ACK=0;
			ack=0;
		}
	}
 */


