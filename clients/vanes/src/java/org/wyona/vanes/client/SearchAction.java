package org.wyona.vanes.client;

import luxor.XulAction;
import luxor.XulInput;

/**
 *
 */
public class SearchAction extends XulAction {

    XulInput input;

    /**
     *
     */
    public SearchAction(XulInput input) {
        super("search");
        this.input = input;
    }

    /**
     *
     */
    public void execute() {
        System.out.println("Search for " + input.getText());
    }
}
