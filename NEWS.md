NEWS 
====

Versioning
----------

Releases will be numbered with the following semantic versioning format:

&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;

And constructed with the following guidelines:

* Breaking backward compatibility bumps the major (and resets the minor 
  and patch)
* New additions without breaking backward compatibility bumps the minor 
  (and resets the patch)
* Bug fixes and misc changes bumps the patch

 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.2.0  
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

* `dc_connective` & `dc_connective_sub` functions added to search for conectives
  ("and", "but", & "or") in context.

**MINOR FEATURES**

* `discourse_connector_logical` now takes a `fun3` and `fun4` argument that 
  allows the user to operate on `text.var` or just `text.var2`.  These are 
  undocumented and typically for internal use.  This move is an attempt to make
  the function more modular, for example `dc_comparison` now takes advantage of 
  this template.

**IMPROVEMENTS**

* `dc_comparison` now utilizes `discourse_connector_logical` + the internal 
  `hijack` rather than a less maintainable separate function.

**CHANGES**


 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.1.0  
----------------------------------------------------------------

**BUG FIXES**

* `dicourse_connector` woud error if a regex did not match any indices.  It now
  returns `NULL` and gives a message indicating what regex did not match any 
  indices.

**NEW FEATURES**

* `dc_negator` & `dc_negator_sub` functions added to search for negator discourse 
  connectors.

* `dc_comparison` function added to search for comparison discourse connectors.

* `dc_filled_pause` function added to search for filled pause discourse connectors.

* `dc_oh` function added to search for oh discourse connectors (more specifically 
  discourse marker).  The `dc_oh_begin` function adds the assertion that the "oh"
  usage is at the beginning of a line (this is a sentence if `qdap::sentSplit` has
  been used).

* `dc_well` function added to search for oh discourse connectors (more specifically 
  discourse marker).  The `dc_well_begin` function adds the assertion that the "well"
  usage is at the beginning of a line (this is a sentence if `dap::sentSplit` has
  been used).

* `dc_backchannel` function added to search for backchannel discourse connectors. 

* `kwic` functions added to search for  and plot the distribution of 
  *key words in context*.

* `discourse_connector_logical` added that allows the extension of 
  `discourse_connector` to enable logical checks of the elements of the 
  `text.var` and/or the `grouping.var`.  The ease of use for `qdap::termco` and 
  `qdap::dispersion_plot` makes them less flexible than a pure regular expression 
  approach.  `discourse_connector_logical` returns much of this flexibility
  back to the `discourse_connector` base function.  An example use would be to
  assert that the word "oh"/"Oh" occurs at the beginning of a line or a turn of
  talk.  The user can pass functions to assert this.

* Logical testing functions added to complement the `discourse_connector_logical`
  function.  `is.first_in_set` (and `is.last_in_set` as the semantical inverse), 
  `is.isolate` (and `is.repeat` as the semantical inverse), and 
  `is.within_n_preceding_words` added to assert that elements in discourse or 
  group variables are patterned win a particular way.  These functions are useful
  as a `discourse_connector_logical` complement or as stand alone discourse 
  analysis tools.

**IMPROVEMENTS**

* Generic `plot` for `dicourse_connector` picks up a `grouping.var` argument.
  This allows for flexibility in use while maintaining the no fuss default 
  settings.

**CHANGES**

* The **discmark** package was renamed to  <a href="https://github.com/trinker/discon" target="_blank">discon</a>.  The latter is a more 
  inclusive term that better defines the scope of the package.


 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.3   
----------------------------------------------------------------

**BUG FIXES**

* `discourse_connector` did not retain the correct grouping variable(s) name in the
  `termco` output as well as the `ggplot::ylab` on the `dispersion_plot`.  

**NEW FEATURES**

* `dc_context` & `dc_context_sub` functions added to search for context discourse 
  connectors.

* `dc_equality` & `dc_equality_sub` functions added to search for equality 
  discourse connectors.

* `dc_timing` function added to search for timing discourse connectors.

**IMPROVEMENTS**

* `additional unit test for `print.discourse_connector` added.

**CHANGES**

* **ggplot2** added to the DESCRIPTION file's `Imports:` for correction of the 
  plot's `ylab` in the plot method for `discourse_connector`.



 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.2   
----------------------------------------------------------------

**NEW FEATURES**

* `discourse_connector` template added to make the package more modular and 
  consistent.  `discoure_connector` also becomes a generic class transferred to all 
  `dc_` prefixed discourse connector functions.  The accompanying plot method 
  allows for a lexical dispersion plot, a visual method of seeing distribution of 
  terms across time.

* `dc_causality` & `dc_causality_sub` functions added to search for causal discourse 
  connectors.

* `dc_revision` function added to search for revision discourse connectors.

**IMPROVEMENTS**

* `hijack` function used with `discourse_connector` template to make the package 
  more modular.

* `discourse_connector` is expanded to generalize to n lists of regular expressions 
  (`regex`) rather than 1-2.  The `regex.markup` argument has been removed and
  `regex` supplies this information.

* Examples added to the **README.md** fie.

**CHANGES**

* `taxonomy` renamed to `dc_typology`.


 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.1 
----------------------------------------------------------------

Initial upload of  <a href="https://github.com/trinker/discon" target="_blank">discon</a>:

 <a href="https://github.com/trinker/discon" target="_blank">discon</a> is a collection of tools for analysing discourse connectors in text. 
