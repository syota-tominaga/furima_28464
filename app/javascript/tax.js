window.addEventListener("DOMContentLoaded", (function() {
  const t = location.pathname;
  if ("/items/new" === t || "/items" === t || /^(?=.*item)(?=.*edit)/.test(t)) {
      const e = document.getElementById("item-price")
        , n = document.getElementById("add-tax-price")
        , r = document.getElementById("profit");
      e.addEventListener("input", (function() {
          const t = document.getElementById("item-price").value;
          n.innerHTML = Math.floor(.1 * t).toLocaleString(),
          r.innerHTML = Math.floor(.9 * t).toLocaleString()
      }
      ))
  }
}
))