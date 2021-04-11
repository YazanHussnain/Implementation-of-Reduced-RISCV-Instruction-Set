<!-- wp:paragraph -->
<p><strong>Objective</strong><br>In this project, we will design a single cycle Datapath and Controller for a Reduced RISC-V instruction set.<br>We will Implement R-Type and I-Type Instructions of RISC-V.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Project Requirements<br></strong>• Implement B-type &amp; J-type instruction &amp; LW, SW<br>• Write Testbenches for different modules<br>• Test Datapath and Controller by given Question<br>• Assembly Code<br>• Machine Code<br>• Synthesis Report</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Project Implementation</strong><br><strong>B-type &amp; J-type Instructions</strong><br><strong>BEQ (B-type)</strong><br>B-type BEQ instruction check that if contents of two register are equal then jump to new address.<br><strong>BNE (B-type)</strong><br>B-type BNE instruction jump if the contents of two registers are not equal.<br><strong>JAL (J-type)</strong><br>J-type JAL instruction jump to new address depending upon immediate value and store address of next instruction in destination register.<br><strong>LW (Load Word)</strong><br>Load Word instruction fetch data from data memory and store it in the register file.<br><strong>SW (Store Word)</strong><br>Store Word instruction stores the data in the data memory</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Datapath</strong><br>Diagram for Datapath of RISC-V for R-Type and I-Type instruction is given below</p>
<!-- /wp:paragraph -->

<!-- wp:image {"align":"center","id":166,"width":575,"height":290,"sizeSlug":"large","linkDestination":"none"} -->
<div class="wp-block-image"><figure class="aligncenter size-large is-resized"><img src="https://electronicinstruction.files.wordpress.com/2021/04/riscv_datapath.png?w=504" alt="" class="wp-image-166" width="575" height="290"/></figure></div>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Modules in Datapath</strong><br>• Program Counter<br>• Multiplexer 3x1<br>• J Adder<br>• B Adder<br>• ALU Adder<br>• Instruction Memory<br>• J Sign Extender<br>• B Sign Extender<br>• Register File<br>• I Sign Extender<br>• Multiplexers 2x1 Arithmetic and Logic Unit<br>• ALU Controller<br>• Data Memory</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Program Counter</strong><br>Program Counter give the address of instruction that is to be implement on machine. The address change on posedge clock. In this one clock cycle instruction completely implemented.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Adder</strong><br>Our RISC-V is byte addressable. So, we know that the next instruction always be four address apart from the current address. Adder module add four to the current address. It takes current address as input given current address plus four as output.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Instruction Memory</strong><br>In Instruction Memory Module, instruction for the processor is stored. The instruction is fetched by the address given by Program Counter. Instruction Memory module take address as input and given instruction output.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Register File</strong><br>Register File contains simple register that are used to store data at the time of processing. Out RISC-V has 32 register each of them is 32 bits wide. We can store 32-bit data in each of the registers. Register file takes address1 and address2 as input. These are the addresses of the register from where the data is to be fetched and show the data on output. Register File module also take write address and write data as input. Write address is the address of the register where data will be stored and write data is the data that is to be stored.<br>This module also have one enable signal for write data. Data always be written on posedge clock. And asynchronously read.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Sign Extender</strong><br>Sign Extender is the 12-bit sign extender that extend the 12-bit input data to 32-bit. In I-type instruction we have 12-bit immediate value that is extended to 32-bit using sign extender. Sign Extender fill the remaining bit by the MSB of input data.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>2x1 Multiplexer</strong><br>Mux selects the output depend on its selection bit.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><br><strong>Arithmetic and Logic Unit</strong><br>ALUR contain the different operations that are performed on the data. R-type and I-type instruction contains some these operations:<br>• ADD<br>• SUB<br>• OR<br>• XOR<br>• SLT<br>• SLTU</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>ALU Controller</strong><br>ALU Controller control the operations in ALU depend on the instruction. ALU Controller select that on which instruction which ALU +operation is performed.<br><strong>J Adder</strong><br>J Adder adds the sign extended version of 20-bit immediate value of JAL instruction and current address.<br><strong>B Adder</strong><br>B Adder adds the sign extended version of 12-bit BNE or BEQ immediate value and current address<br><strong>J Sign Extender</strong><br>J Sign Extender extend the 20-bit JAL immediate value to 32-bit value with zero at LSB.<br><strong>B Sign Extender</strong><br>B Sign Extender extend the 12-bit BNE or BNQ immediate value to 32-bit value with zero at LSB.<br><strong>Data Memory</strong><br>In data memory data can be store for load. Instruction in the instruction memory use to fetch or store data in data memory. First the data is load from the data memory and then operation are applied on it and the result back store to data memory. You can simply say it the data storage.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>GCD Code</strong></p>
<!-- /wp:paragraph -->

<!-- wp:code -->
<pre class="wp-block-code"><code>done = 0;
while (!done) {
    if (A &lt; B)
        swap A and B
    else if (b != 0)
        A = A – B
    else {
        done = 1
        Y = A
    }
}

</code></pre>
<!-- /wp:code -->

<!-- wp:paragraph -->
<p>Now in Project Part we have to implement the GCD in out processor.<br>We define a variable called done. Condition for while loop is that the loop runs until the value of done becomes 1. Suppose that the value of done is 0 the program check if A is less than B or not is yes then values of A and B swapped else program move to next condition. Here program check if B is equal to 0 or not if yes then move to next condition else subtract B from A. When if condition false and else if also false<br>then loop move to third condition and assign done equal to 1 and assign A to OUTPUT.</p>
<!-- /wp:paragraph -->
<!-- wp:paragraph -->
<p><strong>Assembly Code for GCD</strong></p>
<!-- /wp:paragraph -->

<!-- wp:table {"className":"is-style-regular"} -->
<figure class="wp-block-table is-style-regular"><table><tbody><tr><td class="has-text-align-left" data-align="left"><strong>Address</strong></td><td class="has-text-align-left" data-align="left"><strong>Assembly code</strong></td></tr><tr><td class="has-text-align-left" data-align="left"><em>0</em></td><td class="has-text-align-left" data-align="left"><em>addi x9, x4 0</em></td></tr><tr><td class="has-text-align-left" data-align="left">4</td><td class="has-text-align-left" data-align="left"><em>addi x10, x4, 1</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>8</em></td><td class="has-text-align-left" data-align="left"><em>LW x11, x4, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>12</em></td><td class="has-text-align-left" data-align="left"><em>LW x12 x4 , 4</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>16</em></td><td class="has-text-align-left" data-align="left"><em>beq x9, x10, +26</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>20</em></td><td class="has-text-align-left" data-align="left"><em>slt x13, x11, x12</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>24</em></td><td class="has-text-align-left" data-align="left"><em>bne x13, x10, +10</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>28</em></td><td class="has-text-align-left" data-align="left"><em>addi x14 , x11, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>32</em></td><td class="has-text-align-left" data-align="left"><em>addi x11, x12, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>36</em></td><td class="has-text-align-left" data-align="left"><em>addi x12, x14, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>40</em></td><td class="has-text-align-left" data-align="left"><em>jal x15, -12</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>44</em></td><td class="has-text-align-left" data-align="left"><em>beq x12, x4, +6</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>48</em></td><td class="has-text-align-left" data-align="left"><em>sub x11, x11, x12</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>52</em></td><td class="has-text-align-left" data-align="left"><em>jal x16, -18</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>56</em></td><td class="has-text-align-left" data-align="left"><em>addi x9, x4, 1</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>60</em></td><td class="has-text-align-left" data-align="left"><em>addi x17, x11, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>64</em></td><td class="has-text-align-left" data-align="left"><em>jal x18, -18</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>68</em></td><td class="has-text-align-left" data-align="left"><em>addi x17, x11, 0</em></td></tr><tr><td class="has-text-align-left" data-align="left"><em>72</em></td><td class="has-text-align-left" data-align="left"><em>SW x18, x4, 8</em></td></tr></tbody></table></figure>
<!-- /wp:table -->
