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
 * ָ������ͱ�����ʲô����
 * ap_noneֻ����ʾ�˿�,����������������,�����Ҫ��������һЩ����������������������,��sdk���ã�
 * ע�⣺
 * 		�������д��volatile int req_o, ��ô��sdk����Ȼ��get������������Ч����ȡ����
 * 		����һƪddr������д����HLS��C���ԣ�����������ֻ���ģ��ۺ�֮����HDL��������϶�ֻ��input��������inout
 * */
/*
	if(*CTRL_SCHED_POP_N==0)  //ֱ��������256��ͻ������Ԫ�ſ����˳�ѭ��
		break;
	if(*AEROUT_CTRL_BUSY==0)
		break;
	�����������ж���һ����һ�㣺
	A.����ip�б��봦����all the events fired by the post neurons
	B.��ÿ����ip�н�������one event fired by the post neuron
	����������ѡA��
 * */


/*A
 * while(1){
		//1.odin���� req=1; ip��������  ͬʱ����ack=1:
		if(*AEROUT_REQ==1){
			addr_o[writeloc]=*AEROUT_ADDR;
			//����᲻����ڶ�μ��req=1  ��������writeloc���������
			writeloc=writeloc+1;
			*AEROUT_ACK=1;
		//2.odin����  req=0; ip����ack=0:
		}else{
			*AEROUT_ACK=0;
			if(*CTRL_NEURMEM_ADDR==255)  //ֱ��������256��ͻ������Ԫ�ſ����˳�ѭ��
				break;
		}
	}


	B.
	while(*AEROUT_CTRL_BUSY==1){
			//�����neuron event������Ԫû�м�������ʱ=0    fireһ���¼�ʱ�ӷ������󵽽���ǰ����1
			if(*AEROUT_REQ==1){//1.odin���� req=1; ip��������  ͬʱ����ack=1:
				addr_o[writeloc]=*AEROUT_ADDR;
				*AEROUT_ACK=1;
			}else{
				*AEROUT_ACK=0;
			}
		}


	C.
	*pop_n=*CTRL_SCHED_POP_N; //Ҫ��sdk�м��  CTRL_SCHED_POP_N��ֵ�ǲ��Ǳ�Ϊ0
	*req_o=*AEROUT_REQ;   //sdk�п��Լ�⵽
	*addr_o=*AEROUT_ADDR; //sdk�п��Լ�⵽
	*AEROUT_ACK=*ack_o;   //sdk�п������õ�set֮��ſ���start

	d.������startһ��,ֻ���һ��
	while(CTRL_NEURMEM_ADDR<250){
		if((AEROUT_REQ==0)&&(ack==0)){
			continue;
		}else if((AEROUT_REQ==1)&&(ack==0)){
			addr_o[writeloc]=*AEROUT_ADDR;
			//����᲻����ڶ�μ��req=1  ��������writeloc���������
			writeloc=writeloc+1;
			*AEROUT_ACK=1;
			ack=1;
		}else if((AEROUT_REQ==0)&&(ack==1)){
			*AEROUT_ACK=0;
			ack=0;
		}
	}
 */


