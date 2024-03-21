// Lab 4 
//Author : Rakin Alim
//Subject : ENEE459D
//Part 1 : Write SystemVerilog CODE to the problem given : 

module m;

// a) Define your own type (called yourname_t) that will be used for the queue in part b)
    typedef byte signed rakin_t;  // Dynamic array, byte is 8 bits and 2 state, signed

// b) Create a byte queu and iniialize it with 13 random numbers.
//    The random numbers should include at least positive, negative, and no deplicated numbers.

    rakin_t queue[$];  // Declare a dynamic queue of type rakin_t
    int sum = 0;
    int min_val;
    int max_val;
    int number_insertions;
    int insert_location ;

// k) Create your own "push" and "pop" actions for the queue

    // My push_front will insert the given element at 
    //the front of the queue
    function void push_front(rakin_t data);
        if (queue.size() == 256) begin
            $display("Queue is full. Cannot push data.");
        end else begin
            queue = {data, queue} ;
        end
    endfunction

    // My push_back will insert the given element at 
    //the end of the queue
    function void push_back(rakin_t data);
        if (queue.size() == 256) begin
            $display("Queue is full. Cannot push data.");
        end else begin
            queue = {queue, data};
        end
    endfunction

    // My pop_front will remove and 
    //return the first element of the queue
    function rakin_t pop_front();
        rakin_t data;
        if (queue.size() == 0) begin
            $display("Queue is empty. Cannot pop data.");
            data = 0; // Default value when queue is empty
        end else begin
            data = queue[0];
            queue.delete(0);
        end
        return data;
    endfunction

    // My pop_back will remove and 
    //return the last element of the the queue
    function rakin_t pop_back();
        rakin_t data;
        if (queue.size() == 0) begin
            $display("Queue is empty. Cannot pop data.");
            data = 0; // Default valu when queue is empte
        end else begin
            data = queue[queue.size() - 1];
            queue.delete(queue.size() - 1);
        end
        return data;
    endfunction

    initial begin
        // Seed for random number generation
        automatic int seed = $random;

        // Initialize the random number generator with the seed
        $srandom(seed);

        // Initialize queue with 13 random numbers
        for (int i = 0; i < 13; i++) begin
            // Generate a random number between -128 to 127 (inclusive)
            automatic rakin_t random_number = $urandom_range(-128, 127);

            // Checed if the random number is already in the queue
            automatic bit found = 0;
            for (int j = 0; j < queue.size(); j++) begin
                if (queue[j] == random_number) begin
                    found = 1;
                    break;
                end
            end

            // If the number is not found, adedd it to the queue
            if (!found)
                queue.push_back(random_number);
            else
                i--; 

        end
        $display("Part a and Part b");
        min_val = queue[0] ;
        max_val = queue[0] ;
        // Display the contents of the queue
        $display("Initial queue:");
        foreach (queue[i]) begin
            $display("%d: %d", i+1, queue[i]);
        end


// c) Print out the sum of the queue in decimal

        //Calculation of the sum of the queue
        
        foreach(queue[i])
        begin

                sum += queue[i]  ;  //accumulating the value

        end
        $display("");
        $display("Part c");
        $display("Sum of the queue in decimal : %0d", sum);
    

// d )() Print out the min and max values in the queue

        foreach(queue[i])
        begin
            if (queue[i] < min_val) min_val = queue[i];
            if (queue[i] > max_val) max_val = queue[i];
        end
        $display("");
        $display("Part d");
        // Display the min and max values in the queu
        $display("Minimum value in the queue: %0d", min_val);
        $display("Maximum value in the queue: %0d", max_val);
    

// e) sort all values in the queue and print out the resulting queue
        queue.sort();

        $display("");
        $display("Part e");
        // Display the sorted rakin_t
        $display("Sorted queue Contents: ");
        foreach(queue[i])
        begin
            $display("queue[%0d] = %0d", i, queue[i]);
        end   
    

// f) Print out the index of any negative values in the queue    
        $display("");
        $display("Part f");
        $display(" Printing out the index of any negative values in the queue");
        foreach(queue[i])
        begin
            if(queue[i] < 0)
            begin
                $display("index of the negative values in the queue : %0d" , i);
            end

        end
    

// g) Print out the positive values in the queue

        $display("");
        $display("Part g");
        $display(" Printing out the positive values in queue");

        foreach(queue[i])
        begin
            if(queue[i]> 0)
            begin
                $display("positive values in the queue : %0d" , queue[i]);
            end

        end
    

// h) Reverse sort all values in the queue and print out the resulting queue
        queue.rsort();

        $display("");
        $display("Part h");
        // Display the reverse sorted queue
        $display("Reverse Sorted Queue Contents: ");
        foreach(queue[i])
        begin
            $display("Queue[%0d] = %0d", i, queue[i]);
        end
    

// i) insert a random number (between 13 to 31) of elements with an associated
// random location for each element in the queue (insert the elements one by one)


        $display("");
       // $display("Part i");
        // Inserting random number of elements (between 13 to 31) at random locations
        number_insertions = $urandom_range(13, 31);
        // $display("Inserting %0d number of random elements at random locations", number_insertions);
        repeat (number_insertions) begin
            automatic rakin_t random_number = $urandom_range(-128, 127);
            automatic int insert_location   = $urandom(queue.size());

            queue.insert(insert_location, random_number);
        end

// j) Print out the queue
        // Display the queue after insertion
        $display("");
        $display("Part i and j");
        $display("Queue after insertion:");
        foreach (queue[i]) begin
            $display("queue[%0d] = %0d", i, queue[i]);
        end


// k) Create your own "push" and "pop" actions for the queue
// Perform push and pop operations
    push_front(100);
    push_back(-50);
    pop_front();
    push_back(75);
    pop_back();
    push_front(-5);

    // Print out the updated queue
        $display("");
        $display("Part k and part l");
        $display("\nQueue after push and pop operations:");
        foreach (queue[i]) begin
        $display("queue[%0d] = %0d", i, queue[i]);
        end
    end

endmodule
