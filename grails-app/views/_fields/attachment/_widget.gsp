<input
    id="${attrs.name}"
    type="file"
    name="${property}"
    class="custom-file-input">
<label
    id="${attrs.labelName}"
    class="custom-file-label"
    for="${attrs.name}">${value?.filename ?: attrs.placeholder}</label>

<g:if test="${attrs.imgId}">
    <g:javascript>
        $("#${attrs.name}").change(function(e) {
            var input = e.target;
            if (input.files && input.files[0]) {
                var file = input.files[0];
                var reader = new FileReader();

                reader.readAsDataURL(file);
                reader.onload = function(e) {
                    $("#${attrs.imgId}").attr('src', reader.result);
                    $("#${attrs.labelName}").html(file.name);
                }
            }
        });
    </g:javascript>
</g:if>
<g:else>
    <g:javascript>
        $("#${attrs.name}").change(function(e) {
            var input = e.target;
            if (input.files && input.files[0]) {
                var file = input.files[0];
                var reader = new FileReader();

                reader.readAsDataURL(file);
                reader.onload = function(e) {
                    $("#${attrs.labelName}").html(file.name);
                }
            }
        });
    </g:javascript>
</g:else>
