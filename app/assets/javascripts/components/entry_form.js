$(document).ready( ()=> {
  updateCodes = (e) => {
    newCodes = gon.project_codes[e.value];
    // find codes select related to event
    var codes_select = $(e.closest("#project-code-container")).find("[id$='project_code_id']");
    // remove old options
    codes_select.empty();
    // add new options
    $.each(newCodes, function(i, newOpt) {
      codes_select.append($("<option></option>")
        .attr("value", newOpt[1].toString()).text(newOpt[0]));
    });
  };
});