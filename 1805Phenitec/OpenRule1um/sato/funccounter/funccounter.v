module funccounter(clockin, funcin, qout);
    wire [1:0] n0;
    wire n1;
    wire n2;
    input clockin;
    input funcin;
    output [1:0] qout;

    inv1   XINV1 ( .A(funcin), .YB(n1));
    an21   XAN21 ( .A(qout[0]), .B(n1), .Y(n2));
    exor   XEOR1 ( .A(n2), .B(qout[1]), .Y(n0[1]));
    exnr   XENR1 ( .A(qout[0]), .B(funcin), .YB(n0[0]));
    dff1m2 XDFF0 ( .CK(clockin), .D(n0[0]), .Q(qout[0]));
    dff1m2 XDFF1 ( .CK(clockin), .D(n0[1]), .Q(qout[1]));
endmodule