module cla_adder(a, b, c_in, sum);

    input [3:0] a,b;
    input c_in;
    output [4:0] sum;

    wire [3:0] c, p, g;

    assign p = {a[0] ^ b[0], a[1] ^ b[1], a[2] ^ b[2], a[3] ^ b[3]};
    assign g = {a[0] & b[0], a[1] & b[1], a[2] & b[2], a[3] & b[3]};

    assign c[0] = g[0] | (p[0] & c_in);
    assign c[1] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c_in);
    assign c[2] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c_in);
    assign c[3] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c_in);

    assign sum = {c[3], p[3] ^ c[2], p[2] ^ c[1], p[1] ^ c[0], p[0] ^ c_in};

endmodule
