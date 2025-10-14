interface apb_if(input bit clk);

logic[31:0]Paddr;
logic[31:0]Pwdata;
logic[31:0]Prdata;
logic[3:0] Pselx;
logic Penable;
logic Pwrite;

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

