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

 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.1.0  
----------------------------------------------------------------

**BUG FIXES**

**NEW FEATURES**

* `dc_negator` & `dc_negator_sub` functions added to search for negator discourse 
  connectors.

* `dc_comparison` function added to search for comparison discourse connectors.

* `kwic` functions added to search for  and plot the distribution of 
  *key words in context*.

**MINOR FEATURES**

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
  consistent.  `discoure_connector` also becomes a generic class transfered to all 
  `dc_` prefixed discourse connector functions.  The accompanying plot method 
  allows for a lexical dispersion plot, a visual methd of seeing distribution of 
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
