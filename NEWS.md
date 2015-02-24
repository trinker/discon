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

**MINOR FEATURES**

**IMPROVEMENTS**

**CHANGES**

* The **discmark** package was renamed to  <a href="https://github.com/trinker/discon" target="_blank">discon</a>.  The latter is a more 
  inclusive term that better defines the scope of the package.


 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.3   
----------------------------------------------------------------

**BUG FIXES**

* `discourse_marker` did not retain the correct grouping variable(s) name in the
  `termco` output as well as the `ggplot::ylab` on the `dispersion_plot`.  See 
  <a href="https://github.com/trinker/discon/issues/3">issue #3</a> for more.

**NEW FEATURES**

* `dm_context` & `dm_context_sub` functions added to search for context discourse 
  markers.

* `dm_equality` & `dm_equality_sub` functions added to search for equality 
  discourse markers.

**IMPROVEMENTS**

* `additional unit test for `print.discourse_marker` added.

**CHANGES**

* **ggplot2** added to the DESCRIPTION file's `Imports:` for correction of the 
  plot's `ylab` in the plot method for `discourse_marker`.



 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.2   
----------------------------------------------------------------

**NEW FEATURES**

* `discourse_marker` template added to make the package more modular and 
  consistent.  `discoure_marker` also becomes a generic class transfered to all 
  `dm_` prefixed discourse marker functions.  The accompanying plot method 
  allows for a lexical dispersion plot, a visual methd of seeing distribution of 
  terms across time.

* `dm_causality` & `dm_causality_sub` functions added to search for causal discourse 
  markers.

* `dm_revision` function added to search for revision discourse markers.

**IMPROVEMENTS**

* `hijack` function used with `discourse_marker` template to make the package 
  more modular.

* `discourse_marker` is expanded to generalize to n lists of regular expressions 
  (`regex`) rather than 1-2.  The `regex.markup` argument has been removed and
  `regex` supplies this information.

* Examples added to the **README.md** fie.

**CHANGES**

* `taxonomy` renamed to `dm_typology`.


 <a href="https://github.com/trinker/discon" target="_blank">discon</a> 0.0.1 
----------------------------------------------------------------

Initial upload of **dismark**:

 <a href="https://github.com/trinker/discon" target="_blank">discon</a> is a collection of tools for analysing discourse markers in text. 
