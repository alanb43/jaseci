
node faq_root; // nodes define graph nodes
node faq_state {
    has question; // has is used to define variables / properties
    has answer;
}

// every graph has a root node that you don't have to define (we don't here)
graph faq {
    has anchor faq_root; // anchors are returned when a graph is spawned
    // anchors are needed for every graph, must be assigned within spawn block
    spawn { // spawn graph code block / functionality
        // spawn nodes
        faq_root = spawn node::faq_root;
        // spawn a faq_state with q & a variables initialized
        faq_answer_1 = spawn node::faq_state(
            question="How do I configure my order?",
            answer="To configure your order, log into your Tesla account."
        );
        faq_answer_2 = spawn node::faq_state(
            question="How do I order a tesla",
            answer="Visit our design studio to place your order."
        );
        faq_answer_3 = spawn node::faq_state(
            question="Can I request a test drive",
            answer="Yes. You must be a minimum of 25 years of age."
        );
        // Connecting the nodes together to the faq_root
        faq_root --> faq_answer_1;
        faq_root --> faq_answer_2;
        faq_root --> faq_answer_3;

    }
}

// walker can be used on any node, will default to root node if none specified
walker init {
    root { // code inside this will only run on the root node (the one we didn't have to define)
        spawn here --> graph::faq; // creates instance of faq graph & connects its anchor node to here
        // here is the node the walker is currently on
        // here ALWAYS evaluates to the specific node the walker is currently on.
    }
}