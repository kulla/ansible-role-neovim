{% if neovim_plugins %}
call plug#begin()
{% for plugin in neovim_plugins %}
{% if plugin is mapping %}
  Plug '{{ plugin.name }}', {{ plugin.options | to_json | replace("\"", "'") }}
{% else %}
  Plug '{{ plugin }}'
{% endif %}
{% endfor %}
call plug#end()
{% endif %}

{{ neovim_configuration }}
