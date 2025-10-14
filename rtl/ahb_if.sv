interface ahb_if(input bit clk);

logic[1:0]Htrans;
logic[31:0]Haddr;
logic[31:0]Hwdata;
logic[31:0]Hrdata;
logic[2:0]Hburst;
logic Hwrite;
logic Hresetn;
logic Hreadyout;
logic Hreadyin;
logic[1:0]Hresp;
logic[2:0]Hsize;

logic[31:0]Paddr;
logic[31:0]Pwdata;
logic[31:0]Prdata;
logic[3:0] Pselx;
logic Penable;
logic Pwrite;

clocking ahb_drv_cb@(posedge clk);

default input#1 output#1;

output Htrans;
output Hresetn;
output Hwrite;
output Hreadyin;
output Hwdata;
output Haddr;
output Hburst;
output Hsize;
input Hreadyout;
input Hrdata;
endclocking

clocking ahb_mon_cb@(posedge clk);

default input#1 output#1;

input Htrans;
input Hresetn;
input Hwrite;
input Hreadyin;
input Hwdata;
input Hrdata;
input Haddr;
input Hburst;
input Hsize;
input Hreadyout;
input Hresp;
endclocking

modport AHB_MCB_MP(clocking ahb_drv_cb);
modport AHB_SCB_MP(clocking ahb_mon_cb);
//................................................................

clocking apb_drv_cb@(posedge clk);
default input#1 output#1;
output Prdata;
endclocking

clocking apb_mon_cb@(posedge clk);
default input#1 output#1;
input Paddr;
input Pwdata;
input Prdata;
input Pselx;
input Penable;
input Pwrite;

endclocking

modport APB_MCB_MP(clocking apb_drv_cb);
modport APB_SCB_MP(clocking apb_mon_cb);

endinterface
