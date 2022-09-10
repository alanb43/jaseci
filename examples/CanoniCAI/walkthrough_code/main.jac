
node faq_root; // nodes define graph nodes
node faq_state {
    has question; // has is used to define variables / properties
    has answer;
}

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
        // Connecting the nodes together
        faq_root --> faq_answer_1;
        faq_root --> faq_answer_2;
        faq_root --> faq_answer_3;

    }
}