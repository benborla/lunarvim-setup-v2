If you are having problem with nvim-treesitter like this:

```
treesitter/query.lua:259: query: invalid node type at position 84 for language php"
```

Downgrade nvim-treesitter to v0.9.2
```bash
git checkout v0.9.2
```

Helpful commands:
Display wh


  echo nvim_get_runtime_file('parser', v:true)

echo nvim_get_runtime_file('*/php.so', v:true)
echo nvim_get_runtime_file('queries/php/*.scm', v:true)
