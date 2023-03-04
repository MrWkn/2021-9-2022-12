int send(volatile int * data_ptr,
			   volatile int * data,
			   volatile int *req,
			   volatile int *ack,
			   int read_loc,
			   int *SCHED_FULL,
			   int *NEUR_EVENT_OUT){
#pragma HLS INTERFACE s_axilite port=return
#pragma HLS INTERFACE s_axilite port=read_loc register
#pragma HLS INTERFACE m_axi depth=100 port=data_ptr offset=slave
#pragma HLS INTERFACE ap_none port=data register
#pragma HLS INTERFACE ap_none port=req register
#pragma HLS INTERFACE ap_none port=ack register
#pragma HLS INTERFACE ap_none port=NEUR_EVENT_OUT register
#pragma HLS INTERFACE ap_none port=SCHED_FULL register
	*data=data_ptr[read_loc];
	while(1){
		if(*ack==0){
			*req=1;
		}else{
			*req=0;
			break;
		}
	}
	*data=0;
	return 1; //return=1 means done
}

// 如果odin 的 fifo满了，就暂时不发起下一次请求。
//		if((*SCHED_FULL==1) || (*NEUR_EVENT_OUT==1)){//fifo满，那么不发起请求
//			return 0;
//		}


//hls 接口什么时候加寄存器,什么时候不加?
//https://blog.csdn.net/Leonie_/article/details/107781900

//hls 能不能同时给一个接口两个协议？

//hls 能不能有两个参数都是m_axi协议
