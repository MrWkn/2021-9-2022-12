// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sun Oct 30 20:49:46 2022
// Host        : LAPTOP-07KLTU7T running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/Vivado_project/test_ODIN5_9/project_1/project_1.srcs/sources_1/ip/SPI_mem_gen_0/SPI_mem_gen_0_sim_netlist.v
// Design      : SPI_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xczu9eg-ffvb1156-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SPI_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module SPI_mem_gen_0
   (a,
    qspo_ce,
    spo);
  input [10:0]a;
  input qspo_ce;
  output [0:0]spo;

  wire [10:0]a;
  wire [0:0]spo;
  wire [0:0]NLW_U0_dpo_UNCONNECTED;
  wire [0:0]NLW_U0_qdpo_UNCONNECTED;
  wire [0:0]NLW_U0_qspo_UNCONNECTED;

  (* C_FAMILY = "zynquplus" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "11" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "1040" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "1" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "SPI_mem_gen_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "1" *) 
  (* is_du_within_envelope = "true" *) 
  SPI_mem_gen_0_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d(1'b0),
        .dpo(NLW_U0_dpo_UNCONNECTED[0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[0]),
        .qspo_ce(1'b0),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(spo),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JqLVJNxQZkLohSEqQ9ITFybNm9QPcaTh8kyc7h4uGNwD1GaEe9dZHqj61sUilGTlF+FUk7afNjXe
+9yQ4e75SyWC3Z6F0o0CdI6t84E2VRqNvne6PMLMbSrRPmTgt8cbodbZa3saUKncQltVwK/zTxXc
dXyeIJwoVnylCRZ8MPU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RMR60V/K16S3hDpcgdlFzH6vzNttFBxzcEIP9k8l6xLxOXzEGeRk2beZg3IkkpX9ywpiLolj/ijd
pAlaBccK0sBT48q6qTKLouly7vRT3U8EOwOAJBZoDUnL/NwrlIomkg8Pj/4x8iecc9IFkdcLg53k
dreGnJ/4ti8Qi6sHP5Vsy0qpJoYpWsOBc2cmgH9vayWn6WlV7QL8YjnFQ6bQnWuyarN2QQK+bLzc
JrPAdTBzH05U9MiHwKRG1GlZxJA5fxQttnLA39Nwggz6r5qeYai4Vo+J8h0NQDa/GYHeYKSYsF9p
VKrYe14mz3CSYvF3+NMCtnCz+VeW7lF95iKCXA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k6iMAgjYok8KaQLMY/TME6/aSCYTKFMZWtHwbD2VKIKOoM9woUSioI0NuiYfkPizuiBJEl8Af3NJ
M5VmpW3SVM0lwPjVSCSNmHMIfc2krrmg962M4XaG4w+tnp7hwZbdNZ8ahj6pOLDYSTGKwdGQanuk
rIQbC+15rT9WEK2XGDQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lHyAdhaPyzMCy12MalQZTt5ud3be/nityQmJ518pNrYUzgCs2nz/J1pZZgf+RWFgX9JUwWOgttjl
3vfihnzL/+pRWaWe8tlTToa5xX6V/jpw3hAcktXx9YKYreiOr2qpeTLkbp0k6MDPx0OZ6zF6OnXU
mj71WlXFOMXCx/95ZDxCuphivrOiA+pFZwGv2NIFmX/Oh4q8NTSFzJYzF3L9rWrI08UUEu9QuuxY
Iqlhuw+fXq//x9+jC7JNcedTSCXVkefBvZdJcbH0kbNA5ChG445apiF/OiKhKxTUjVKp7Rkm62fE
cFEo6KH1Cp+QaVxNQ55dcOTpVSSDpQGvshrQzw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D53lVPGhmka10zY9LQFvI7i1UPoiOm2NaQ+1PpDUs4OCbAMqPLHQSHIZ3EMPWpwgdfAtW9t+9lxl
o33XZq60DBUJ4ZKPRvcfbZCHmpPyjm3Rs8+ACxnIH7G37stehOSCzSXeqM9ORqajk0MjoE3bDLx9
FtW+eEPY1KauFU6KHAWAdaZPPnc5QfgBkK0c27Y7CfkJ049Sjv4lFwtiVOmSkCvdDDisv3/WAcSs
c5Zo+cJIWzw/prfWYTGIB0goZNZRXZpB/aULwQ5itLufopA2f9cHo50fqlIvQX4YoYlfQTXpj3Lj
Qd+7/1UmFCqQLsnOUXy9D/tgspVDu7POGbmsiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bN8g8/EQJ5JNLmcuNioMXeo6xxPhQlbGMqXyUcnPTkqRMGYI+G4Ejpt9cT2XLx48MsTE+bzhGByG
1H1pqr4NO588pcozvxJ5bo7FJRCIhLP1e3pwipkX+z6IlClWyStmkrlQmh4o/jTM/s88Fv0m7FSH
jNd3hhAeYNPIdw9Btn4UcBuZre9QZnCZ+Qb3nW7FuuEd1RxTmP0y9EFC185+bRy+SMigW3FTt75l
qdmakEvm3BkGv3IiztGz6MLRqvBdHQYtaZ17Jeh1xGZ//F4QzRytN/lcdqSrZA6MOo1ObtGE9SFJ
SDo82E2CZlkQZfPVe6EC4/a7V7wIwES5EDHHnw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ewjro/5A8FySdAgSJfHQFGxdnPvtSB6vt25wsSfZkZlB9FCU7IhXRDEGCyqtZv1GE8Vi5CjQkNFt
lkkrCSRYIU5yoD/IUiSUo3oerXD+F7eyfUTsdMH8pyAOmszG4J/U4h2F0oGz4IGjnQhlKadatt3U
Pet1uDdo6p7Uz7fluWoE453v5O5Ag7QL3l2r7pK9QbtKW2b2ZgHI0FP1PfpuAESmBITtaB68uLNI
9IqIpc/l+MM956Gz3Ei4nFXbBqRkNnOoEIr1KKujTAkLJl3zAW45fRxt/SNdspyyOfwqw8HQ4aKl
7gQZLNfO7M9S9RaTP7tfDlNXrjIs40/SiH7VMA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
BU7byHg11K8bY2oU9sv2hTEzfbBQxIL/wbPRcw3zRiIVklygkCLwToVotzcIxQi5+AgzzF89UJr5
6GTSf74dEO/L+7MiiVhop835AvOvvIFH3e15os3Ed8MZ/CykLdSs8kOVPSgygUECxKL/9FDmPOPu
fo2rClbqDh81jw/cX48EVuss3UxP/PNd7DI06TMx7v4Cwbv+pkvbuSJ9JUQBcJB2a2vbXuFSdPnT
ejL1XTVXeTbl2M6D7N0iqk4rwD1DAC1ao/d+axn50hvVPzigrvjqcQX/U1IENh7yF/bcNB1NT4d2
IdXJlmV2SEYwQNjb9ZTuSLUlehhVKrT3vH5zFJC80glrrjZK2l4tx9ZECJLmYjz00oxWf1dNVI0i
SuSyr3w6cWekzZQOv6vsFN+CRqWOkos5IUF5EaLFMFmcV5BtlgtZ9rm6OCo3zn726oQF5zZNaTBv
qrb5vLe4ELSA4fL4YBwiVDxVDpGpLzJNu+m6WS/V5oWJs1UQV1sRHSGu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dAIafnl1hEJ76Z8bYZlZKSAU+OyCQ2PwlK+IUKj9QNvxJJYU8c0z5dZmxP4ePLBS+vp0Lekmf+JK
ZmwpMP0AH+BW93Y8Y+QNBeNdszz6mwXF1zf7ZAzf+51PzoZEli3SBCs9JMOdSCtnTg1W+j4FkEYs
NWN3ZK6tfrYSbplsV4lsmoYu2c81xW2Ns3lV8YRQCE8VSADdb1pe8pEztQYXzBmAfCVgwFNJ1kXV
pEtDN1MRi07FvYZeUJ/cX+ebYB0p5w0vxVO4vSr0XOHKMcQkxb/64oEoe4AhHQNWURWYKDxNNzm+
jElAKl1fJL20OmItj+GmJlETFK09uAgqwtZ5HQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 7664)
`pragma protect data_block
rAxu+87Amqu2KCZ5Wk0ihvK66DDgQK6tH6ALd0USCBY6q0mALz/iDGhUYfSRoOT6jsaV9n4vyW9E
icd6uxkKNycdfneocVgasy7wLYLiPyw2he5jYIQBriMX9uNKUwoWM1fiPBekUYElYRsaFoD9Evaz
jbqZB/vttPdpFelgkBW+qYIImU09cA/OHd31d7eZBS2eMV/N2XPDoHohCkke6rVt3yJzYs0VPegX
xHJ7JXnsVYSgl6dHU4YDVtWka96N8zEVjkn81WJgFpUyvEXvXKDZj+5mKpKx4MKQpbfukjAjaW/R
A+PWY3kAJnE2BKxY+Kfbo4KT63Xzen461ueduG/y31GUX8OPNCtlDR0QyqrnlvHHc+L9O1h++NgL
ugVOUYyLbax6GMu+8uPNPpgOMXK+kffW5IUQ0UsrW1ZeBJcDWGF1pEcoKiLqLNZ//2X4aGkCd+Mz
BbRQkUlE6aJEOT5ZbeK8NJVvcVB1Kv7npp99e36LUXOK7RForlPvMKYko5Kjte8D5dgopTOw6rqE
z+Zg54E6Ah3mTOWGBSMXlUMJmIMhBQHc8K4E7hldlOgRqhkgf8ilBAJXc4tfaMYzolLICP8nqSV3
5U8i4eT1iidP1NHkGPsreIclGN6lpSgAVOtkb9VzAmKZAt5AMDzFQWBijmbDq3a9oGPFXDbJM6Va
6wnbxOmme/09BmnF18zpACrDpb0pFuezDcF1V3qMhBFu5QXxewd0+4tVjVDEspUMGPmL8QoBwAmW
3OlSML833ouaxZ6b85LdFbwnF+nvjBN+ESVLmOD9GUYm7Yocym+zrOQMceeJZ0sd2TRQmZOykgeg
LkhpDB5WsCAd0CBjFBtzN3rqO/w7JRpbhH8K9zy/oQhcBA9TjNgPJd0rszM/IT3v3GXegEkVcubA
L/cYqNjsaJ0iFwdwdB41JTOP1myx3QwCZIKW/6IxgIRRlVALBpT0/qT0geFjG3qZXw+m37nmwu/k
ZVpZrJXsUZxIjiBpbyfeWbe4j6l0/jZBjvdA8qmZTAaeIhbCj4lcz2FKbGdDboXnGGLBtnV+Vzbk
hHdcaYdDVRkAF2bNAClI+DhL2t4ExfK/W4NEvhrzf8LuGe1dsrq2FaG7pqOAiEBTF/5Q1bpKhs+D
WsoJb8PBlNCcFwMQkezW+l1uv07AI9AcsqkJ92B4Ux+SYmnz50PCKYx10s5Ly7sr7Q8armNhFRUV
8SeW6BYzar7U7WRiXCDjMMLg4qLUBJdT54CIp8H1hW/Den7XPDMa8qK8+JPzY7NHkK+rNP38FkJ+
2TLk8XTUztUIVmXlKN/h35YiAcKOlVB2I3lqOzm/kXuDp9+uKwrSZVAfLdH6blyfFXTU9NqhTGjj
cw7yuUkL8OzpvIOCdaUBrQNJFkYqwJUYdqaa/o6NEf57p902oSl1JyTUiDTRWYeYhszQJvn38pPM
KeXDujjU1Uu7WDAFusTksU5zoDBlcKNgTtErvsh0JutQyFzjbH9vBIYV+pPuIFcbEI/1nT/Wg8kk
C7zCm8d3cnlmFnEO5MuMPUrjx/NUmqTw9Jgg75rpoGWrLisHvKyXQR97pRNIjiFDwqfG5DO5uoiF
3AS5JeZCD20taIQ3ob9W2RlMttzErSqyRGeii7NAHIYbrldd/N/qpaRYGdspZP1+1nDf7TuszTaf
sntq9xUaqDrdFc29GMOKDUUuVDDo7kiemn4DA/aTbFpkrEK33TOoiDGCLx1LJTeUcu9TwQJmw8AL
c+m0QTR1QoHPu5W/e7ZcCUMVRcY2GA8gy5q60ZYiqLeCJIfhR3JLkIvBRaPuYHxENM/aSasdx/47
zE0wD7OPjZccARPlgutVrX9OKluyhNbBEKBoCzlBxtcB94wwXBl8tFAz2wYQRErViltBFUbJ/Ksl
mTnHgbqWJxy4mgqAN+KgmsJiNOHBSKJCSK14ip0eijb5wcWTztIX5hT2kdBO0Cfb9kBlAphB6NRK
IHXaBIGie7rUGOyg1RB2ItgcObdDomMDXIpEFxpT8KZbLie/Ksl5x8Yf5o/KRApuetuFk0lf1o6H
pJMnbohaR8vR3c4hqZ+rSXC+zJJlQjVpwWFEyj2ByqP0wEh7CDyjTfgDCt6exBBybwpkuTL3CVyy
6+PdP2PMIniVfLoc62MHKC+iq+t4yLRomnFwCE3LLQBDv1o1IPB/YJQEX7YveDYk5dgHuF0cXzLy
73s++oVrm0jdn/OfqJSd+08vhpNv+awX32sIKaBGU2WnnTmtkhfy0/PzAabzYzFBDVxxaM4nf2mR
y7H+RFBRq8h4n9TsJAv5Xb2+VBxFY/q//Im6/OQbJreb6wHunA2jwSb29ewXI983QinoKdnKoMuc
cTgBPQhm/OBSa/wEWCBo1Ai76UNKsJzRqP2X2bMXnzcFmdOJQ/Sv10gFVg9hxvlcKirfaJoS67eP
sdnelkXY+73oEWH2n6kC65ZQ+mcAEb+j5jaFyUw8+RqDlAYR/rplyafOrrAQMQvb7ZVqOR5KafB+
dHbUJGYffQdyMRETXx4teqtAgkrF0BP+2mqkltRGXtFlkmtBt2/2R5Gi2vSlQRUDsmxOiMeIQOm+
L93yAVQmukytuLsVDkEUTRMlnNX7UC+I3KhpSzvKp+FV159JkWzLy0y/CxnxEGafmCKDIEPdZ0IV
YE66Ubc7d2K5FgCAkeaHUijghwnJJT9h+F1ZGo29+SZzirq4Oq/6QJebR4cizLv+qz04AzV/KO+W
Cax8VObfjxQV2kMEoDmy7badRb8YHmiUDe6jvNBLPzgR/YU7ejbRCxoDGjoIKyjSOiuZnPBUbeGs
jxxk/fOoLND6sTXAZF99MsjYR+lVOPno4oOpNg2PmTimz3u0AnF2S4Kl9qx0vjcAM1AmfHM7NPoz
bbvYIneM4n2XL+oCtAPOxnBUgWxyxXyCJ10Qn+8gDnM81OAzyPoa99eSZ7HL61k7vN54jqValC+A
0G9P2Oo5U+/HxWdRlnnnd1QVzdkJ7AIvGn2G3w98X4Ko5snauEXnvVZ80N/0umuvD6gh2zWb+Nee
dUSCoqx3MtA+KwWMzLftdUqmfY8b2ijMCTASfuwEUHpUC3Fy1CeWtNZYcyZhg+6sW3n5iAWHp+GF
jEgY88l0IyiQRMUvZeH69oxfQzPGGuR8TLEcd4KrqEuAgZNVMSt5RDl/rGkJtiVobjn+H5WVuw4F
f9Up7bkUl65yj2UU0g/RxqyM64FlbVV84Oufqf89shdVWTocsY09UNAhfK54NrsWrDiDhSGzufVn
Nw/vSJRTQVP0xKhAMcnok3acnAUjtN82D3cvBje5GwLYggn1d9hucldqwbkL2ON4AUXhTOTYbc8f
LuFIhkkOzxRmPB1W6vWq9hLXZsXxaG7gd4bUt/hY384FA/CvP0a0A/wVnwZ/kyL96QXu4ooVl+Sv
4SuP1fgWZjwkPnzt5q4aURnRdxy/VM2CKLTC0frErDf3JXDY+bm1UHs8UdyFLMRWlyCzyQc3j2u+
QJGdm6GJElvZEgzrFxwByTrpkfDRW4MEkqxfjpAZjcUEcKulKng+TV1sNldCU+lUFlgfQfQlBSRO
+x1cOdk8jr3/UcqxnmsUx8nGIU/ag/NKa3erh4yEmSB371bIYt9hGISZkAv2Hp5Y5fZdyfVyUBcn
X9vMfCSPpwqdGMftQvXchxWCwXkC6Qa5+u+URdbjkkc8JGthulOsjh+5gawHjUtAv7tR5/6i9I17
K6jAKPLQqdwrdtwymMglI1r6uKixXTay2wkdu3WhYIo71ZZD+bkqEp7Z4BuSK5FAQFYEEwQib+wj
YhL62oa6aR7OC/X1MQKWfot/Y2DZEJ9z+sqY4th8+EgWGW06nmzN/vCeSKJoxn7fZcVzJWL0z7Kz
5nOB8NZp0SKf4WWYJ9Yy0CVAVu3ISElLtc7py+5WIw5pi08DfWFieNiH9Ack/e01yY7y3uwyk6o4
7Q8S5C9SbbK0Yjw9QZqmgbdDKwq8eRJfmKcDJc2UDYhm2sKtjJUWDHe1GZorznrK/NkojSFp3/rf
Q/vlJKfsOiusyTevAHacQ6Kkxxqaok+uqQlYlOtGAbwaGx+x45NiCZHsfvmCkrYnRJVv7iNM7xTb
8+OuOjygd+IGa+AFvBSZG4WMsm6jUwAlvEA+xz9tuvu8dbZV7DixCm862EGtGNWvfO8GU8ztMxzD
JuVqEec5u+7BttMnKyhCFhIgmqYNoEQX9y9Umbj/LCBoVoE872G/sL11U/tyIyPOXtpM36bV/IXm
B3PkJhrs0LVAXXF6CvoCoQcZ7ygdlTUeaHORGZkLp8m6/EUPTEPg5B7sL1Uh4lTaXuO2ZUCHqK9M
hYehOxpj3KYzvz1Jx47/eC5K5GdooiddHVWu+vMFsdZVyIRWLbmLRfZzb0+wGZXoLoldYsfKMWk+
6u9oPKiHmSEwOFYzWn7mDOBsCtWKfLcA4tBVIGxl+07wiGw3pwE2KhAtHZ5r7PbQZrbmZdMVA3Y+
h33FP6oYQpXgxKEAb18BJYevpDg1lRPkB3tIorWsX64QDy8XmBdBlpAv8DNEMafJweXV/IO8PFF8
sOC/pHQ7v4vJWTwojAviV+O2OPnqFCzC35YsphC33gghrcw695Eug6OtUsW+p8i5KJ0tChNLAGZH
kkxeCqpSpNVa6Mqi9vqrzJw5cMfIxKo8jZCT44/+BQLF/qmjP1Aeqg1bmyi8/9fzsx2tEwi+8qH9
qh8kfPv+GFavP9L+/4/orabp+CFxySLHwkkt5Z/Zy3SgyC8HXu5lm8R1LxAlyju3dHKsDV1fEsqq
BLa8ZhgcagF+B1ZahtrKPszhRbszRCOYiHXLBuCfwYSL0qUxgNZZ2MyysZDAtGl86C+PgxZz6v8k
iAi+mYBjkt/IJI4tQLXGoLhxz0I+DhrGMvN+BcbnouZ5qTVbXr1vkZcN5nUntk/kRWBwhpA3qRIa
3ndyYpxGvVQaeUY1eQbH6mo7qzEdlK6KRW1axioytxNOC89w838IwCyVL819ZJkiyeranMLS8cWV
6V4ymTZYrofQwXGbTnnOvJUOaZicRfRiELpLnW8QPB26kR/cu+AwVhqvkUdJ0m5SdrLDzQBfHUIB
Ghmynn0UuoYnOtvQVAGUPcC1yUl0VgoW/K5td8ctzp4Uh9ttQ7SMEicrdDd82CFygNz1wRY+5+lt
NMK1ou98BMtxefKI7F+HZHUPxTDB3Z5RiRhSV5GoLjTHJ9kEaOdvlS2fx8BLCAQHnmPEz8y3nf51
CCIXYgqZK4vupwXK3ls6DFPQjNaOJV0DKHBzfyfwcKJnzbyRzGGfpzZ1HHiI2Xco8o/NMsE5BPfi
SFwJ7pdkcoLb2R06ozN7vlE2TmksK+969M8sS2fqypdc/pjwnKjtLviM2HAJVMLUq0NFSo9cQ5pe
tTgQ79PEWfQs3POINQxLVr1pYOoPrS6wJa2r8t23fkjGQpU1z5u+btG8/nk48btmyanq+c53vdQ5
gmaQ5LbwTl4K5F9wCNp/MJBmAL+dnKeuwxqWO0lrOnRhZdU4EsKarPih7u8RpQtkltxvnmpexC0p
glxkVXjCOYbyPCRD2wNnzCHHgI+WmjyFhkVzYHv/B9pdJDm4bhMGuKcN6ZmLGxw2zSkJh+J7ydu5
xupzW8G2C0kUWFBMuMse+cGO5ymPv409wIsYGgvpRPvizgpg1F8G/tzmgaV1YRd1xcj/wMZMY+Ij
Rnzl5MZiBQHcbsCEDFX6DH1tQ57X+wIE88r2mncDxuW1LeARtMZKjZDQ7lpDxG/U1cz3hKOgQbVL
KnlKqOZ3V6iB0yVabVJ5A8FnHUjRG52KvEk8asCCf2FaHjRKFMjr4bpRFKti2q7M8RATh+L45kCo
5sBH6Ur9rfSzcvcJadVB8QTNjjph/Q8UdBYfuiiqSdV6SW9EvdlIzuqAS58dJPJK6lnF2fhX94qx
/LGFSDlCK6S6/i+MEGzWJcdSAMAC6IO0AtzIG7uk0VVh3mVnVn8UrmhUHJIkAxS5y3NaU5TXdOja
DmVLis6pXd7tvAUZ6Y95r8W1oYvqJCsPQeHFzBvpjiAGV5zoPZY6Bn1X8gvOBjsdcvQ2Mupm46tA
zZLv4eRcfbrAbacQ/+3JF8lIoRr+GhyUJx1tZxpuFSGwPie4eGs7VVt/+XCzgbOfWgDZBxE1oVkf
prov5QvsQHsiNYlMFKEFZR0TbOh4BwRA5uW6loCv735avPHWNqU6MGguLuHq8xO13ekm1Wz1Fro4
SyHPbs6UqkeG3HsGQ47ZUjYhXNwPzmGR2JKI9IrgZXme2kUt4fmQr+L9gvIAIXCXnSjM/RG/T6z8
CCMtduCh1S9W8mpbv0MOFDegezT7AFbYpQkVRSGk0rKI1yQP3YZ0irPxoon14leGw80gkE33ZcDb
4gQO3K/YBfQB599zDPgjKe2CFVtLBkZp2wL1zSIDFFqdMdwMucXN5dSlIxEyw3hys2fHDY4iEdwd
5c5DZ5HOwSqCSUw/Ux22Opzry4nY3RLwE05/zThwhqTxlk+88VmzFkVZ/yZEMiGFj6FXJz2rZ4WV
dF91T9gwG5hv0tyUgU8pPLlRzp6xoNEExQp5MiLSzcXh60PZfDZ+5k1WSVNw+umuuofcSDMWoUYW
VoyrEY8UbvLq8a6IhJbSwqzuFFYyUghiRe8YtTKUnpyRELNayWShlGrQclMB/rN1JKeuVjTL2tQ/
H9QbIArmANetWzsyGdPV9r1Y8wp8F9GIQtqIA2vl1ebdmfRmxN4LpnK6dJi1yfHogiuvHQOrwW5m
rpz5f1ayBH9rleb8f9RsnWPzwqTp1eNDUtJ3xtJlJ6CzGjBLFJaaYidddfPkr1VAiLlqfmLYPaKQ
pECkibI1hIvPOTP3WIqIUNF2XwHLJie0TqZuKvKmxk2G1ixeRqGXlHKEJFzgqmo5ONQ76a8xGlgb
w7ta/ghhxA/BqppQwntZTomX7VnSZ94/Dp8tQAw2S4k0VI6yza+27/spfFHumGqzHFZ4jFyNp7wH
/F834iWLxPdLHgKAp3cA8Eckq6EgkQg4DE+h49MaE0I8TZI+AHEU6st3qhJTJkYPXwTpn+bOg+N5
u2fxvm0rKeCXw82+tpr3JO1IS5iIGqy5JJMGP9Nb56nYOxDExhG0rHkAP92wh183f3DJJzpDtjY+
fbKOAl/Ei6ockPJRWORjUHvoYWtR5Cu1hzJRaFrmme2y3cNuOcihRzU7PygLQ9wXnzNzHom5ZGBB
5lvTbPheZ9fhTPWoRgzJF5h0oXF6yewEUlCcD6G0dtPqcdgACNnX7lOhOUG+rkwKWkSQM0wnNLpA
z9FAmtjfI8jLB43M0NU5vm2RyEnJmEqtJdx9kTJHHINCGi1dpDIcqJLNReZY76F1uBV7O6Y3u3Lr
pB4ClJP7EQURMcDWiKyd7BBoTfscO603mx6CwhtEUSUVjaIbMjrck4CiAWeU4p8POSolxDtW61Ob
/Nm14Sj9klXPeuhfCbi044Mrkl3LpX6cwsjqJDhsN6gLK8SrfTMht0MbEo2+ewqUiibpoU6oOlql
cwnKPMpCeRQ5N0dB90ff93tQRP8EDlsfeW5YjBQqQQqliun6cKJslA79QBQ5bD8MTmM9rZPaCb/5
yhXt7eBIGvhHTTi/tSg7vNAxN1f0vzGLMQ5/1uQ4CbQbO7E4iWvwGNcbYArGp3GK1jhV1vXTHY2F
aaGl7hHeqLAkmYlgejSJs0p0ap5Hy5OMfN39ecxrKv4We91nwEyENIGr+MCPetZyz6Diet6To4wF
ahPzerktddRkJ4dM/rQ8vyKG6j1GF2u5rP40aJW/1xCL0JZZaABf2LF7K0bGEBSs7M9A6YlNm1vq
BiNd7gAAp1qeBEXAU5UqjfLaGcNEv+Vq+J/A6+T+oVICDKDAMA2jJ/Kjk3PtifLDYo68NE7pS4Co
GeeEMOJhb2IPtMUHmZSe2a6X8BU+mAlm9l0Z+B9f7MEsLC2H6N0P5mPLodhQUaAOnzF1Dgu3H9S1
5olaBtF7YcAUZPBVrJYskgcj5iniXuMQHRLcufn56KL9E4TRIs+K2If6hHzbNodkcK8DJ3KuiUtJ
2LnCmLYdbKaiUwNO4e37XX3rwnq7ub48BqERWiKEA4t3FALkDQU4rgZ7jwGaU3vVbvD84SQ/YUGy
YHq2Y2c2g8VuwYtvnSx76Iae6+S1CY+3kjNCpi0FxUmKEWcoM9Y5HQboPyhPGv0rv4Sj11Nzs9MI
UkbOatKJ+O4RcUTmoiU7mbRjANvhoidVIgVwUHK40Zzq7exVEZLXBIZjmH3PgZ/yd7GFsxaOwH8i
z8T2ms3I8QCU/rIcMXjDCNUz+e2cVTxZfeFejcG6oWzJ4M3Wm+bxcC2nmUHDyDWv1YG/xbd/+YQT
u8+DEMv2P1ZD7j6RULWcrgeev9CGG9csohPdIPF4szTvn0nkfCTEDQRPD3ua0P2j91KbdbN4LG3+
DZAn9/fi+YHDH5TMD7v+Vh7njs5DvpjJ1RZoiNSHGLp4uJEn1kEqjzoSvdEairQzxxMSrw6r5a0W
nomjNoc4MaS7VNiKfl8YjJEY+Z1vJq1Fz3A4O9sZHcEbqnLTf6yTBFPm4jy0pw6vpRKvnJ/i/wzA
mMK4YEw1/RpprF6shGjDSSNC/FgOPo0V5BUySlCSmJiAVvtxBkr8B6TyzrFjJ66slhZJUF9R8zAX
Eud3UhcYoCLCU9YyHwYC1ylGaa9u7EKd3xC1SAO/MPTtbf3gdwpYQ6TNtd0CUH/oHmqxiu5QcqJG
LOv+v4EdyI+94eKIP+9okvrDZsQY23pOrUQne6Wv8OY1kGizyLAkJBNQ0iGeq1NbpA3iaYXtIAI+
aM2/a9ReK+SgiN6oDp8L1vOdYrz+pMX8tP8Ky1QKpwURs0a6+BbO6fFMczfIjIuGclGOkPUL3H9h
bcjfnGy6FFozotTOZFjzzSEVd85I5u2J7LUyZUOaVQPvT+w1QGKPtuKVTyRjz4Jfci4Pi+j8MfbY
APVNJ6i0NTsGRXOSvVJBKhJl7ZjqJJ5dHit1q8KiNpnlLCEZFfzOO+pu2WxhEJvmna8MaImzS1a+
gay+iJMTK44XBvOF1dCLUASAcCN6VykYGRsbwydR2EhcSjugKD0AVjvGrUTQ4UlKmqnIdBz29kqk
+MDdA+QC05HMLoxe+BQ+KnQXwoZuxqmRxRobd+96TnZvaLNOC0uQ9chdRwC3a81juyp2pKbQeGOS
imh4ax2FUrifwIi5uBhb8VPOOif5Rt+QfosfIa4vHaujdl+H6BG9S9eQHteabOcTYDz+l1g8QqCO
6eADDnmJEwXxr9frR40huD+4BNdfD/NA86CYY1KCNy+B3LqajT8604Jm1/C5fhd01xdLiYK+DJXy
rXFj+6wOpEeJ7AHydUGTgePCpNaKtW12nh1HWSNP2edsci2s/1N74mxLOV/OUmewUci02EcbQp+X
9yfrWXQovf/Qn/ZrDisOUWhk/RVKFKA+U5WqREsO7RiUqVWiNe1VmaJJZdWi+yDFYDrs8pLlm24H
z/ovNZbrBlT1ii01ztAntY59QnGpO0oJKMvq4W5FcR1pZm1LdXOZjb9hGDmiuVt/WJ7TBs/46pcf
30gbEm6oVwSxrAFqHmGlJ2EZdZB5ppC5f76KKzoYiA4E2GIMrtsTvDclG+Dy53cIBoNYaqJ+d/4V
iMB3sq3gK0xKi08QXId7/pzV2yAkNF/zdSaklMVK4nYJPZOOZ8WSFKddsLsFkdTS35WMcxMJE/wP
78TTa2Ruecy9N2jkhtheF9wZXjLiTtM7MgSdnWgfUz8vIotbXo0Rl1iFzhbij5OnNGyouS05lTp+
HwezhYwDC7mIYiVjDCoAEGglTSQiHWbWfhebnJBAd9/PaxdeotQJFEttzFwAnWgE+uDFqiDwp0cH
BBbOcZDoETIhdOD95Ytlyj5IWF9UpTRhFE/yLQjYN+pcEMX9N9BrDvrG4CzD+Sb28fm0lfpOTPEa
9X6TUoJIxS7ZBrEqN8iiPB8jOWLM3O8WIYSNtShaNEgzujvAg9t8n/xdzDUeDMq+822HlqN/+49s
Pm1QRGlvyDus4oi1PdfmENyh+VveF+bNv2YYnSXuS6ZYLttix2WwRUxaudcIRowWx/gpkUpzCV05
5YkNyYZVXW7BIFiKo+MCV4THcI5KH4CqFwTipvGJJ603hahvmLkbUQVTYUxLLeH2bVyHsjCcqYQW
kafheBx5IEQbA9+v7/1CBqmTkNCWx31GtiE=
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
