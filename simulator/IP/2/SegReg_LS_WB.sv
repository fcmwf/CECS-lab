module SegReg_LS_WB#(
    parameter PC_RESET_VAL = 32'h0
)(
    input  logic [ 0:0] clk,
    input  logic [ 0:0] rstn,
    input  logic [ 0:0] stall,
    input  logic [ 0:0] flush,

    input  logic [31:0] pc_ls,
    input  logic [31:0] inst_ls,
    input  logic [31:0] alu_result_ls,
    input  logic [31:0] mem_rdata_ls,
    input  logic [ 0:0] wb_rf_sel_ls,
    input  logic [ 0:0] rf_we_ls,
    input  logic [ 0:0] csr_we_ls,
    input  logic [11:0] csr_waddr_ls,
    input  logic [31:0] csr_wdata_ls,
    input  logic [ 0:0] exp_en_ls,
    input  logic [ 0:0] mret_en_ls,
    input  logic [ 0:0] commit_ls,
    input  logic [ 0:0] read_ls,

    output logic [31:0] pc_wb,
    output logic [31:0] inst_wb,
    output logic [31:0] alu_result_wb,
    output logic [31:0] mem_rdata_wb,
    output logic [ 0:0] wb_rf_sel_wb,
    output logic [ 0:0] rf_we_wb,
    output logic [ 0:0] csr_we_wb,
    output logic [11:0] csr_waddr_wb,
    output logic [31:0] csr_wdata_wb,
    output logic [ 0:0] exp_en_wb,
    output logic [ 0:0] mret_en_wb,
    output logic [ 0:0] commit_wb,
    output logic [ 0:0] uncache_read_wb
);
    always_ff @(posedge clk) begin
        if(!rstn || flush) begin
            pc_wb           <= PC_RESET_VAL;
            inst_wb         <= 32'h13;
            alu_result_wb   <= 32'h0;
            mem_rdata_wb    <= 32'h0;
            wb_rf_sel_wb    <= 1'h0;
            rf_we_wb        <= 1'h0;
            csr_we_wb       <= 1'h0;
            csr_waddr_wb    <= 12'h0;
            csr_wdata_wb    <= 32'h0;
            exp_en_wb       <= 1'h0;
            mret_en_wb      <= 1'h0;
            commit_wb       <= 1'h0;
            uncache_read_wb <= 1'h0;
        end 
        else if(!stall) begin
            pc_wb           <= pc_ls;
            inst_wb         <= inst_ls;
            alu_result_wb <= alu_result_ls;
            mem_rdata_wb    <= mem_rdata_ls;
            wb_rf_sel_wb    <= wb_rf_sel_ls;
            rf_we_wb        <= rf_we_ls;
            csr_we_wb       <= csr_we_ls;
            csr_waddr_wb    <= csr_waddr_ls;
            csr_wdata_wb    <= csr_wdata_ls;
            exp_en_wb       <= exp_en_ls;
            mret_en_wb      <= mret_en_ls;
            commit_wb       <= commit_ls;
            uncache_read_wb <= read_ls && alu_result_ls[31:28] == 4'ha;
        end
    end

endmodule