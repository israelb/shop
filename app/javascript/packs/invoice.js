import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'

Vue.use(TurbolinksAdapter)
Vue.use(VueResource)

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content')

  var element = document.getElementById("invoice-form")

  if (element != null){
    var invoice = JSON.parse(element.dataset.invoice)
    var line_items_attributes = JSON.parse(element.dataset.lineItemsAttributes)
    line_items_attributes.forEach(function(line_item) { line_item._destroy = null} )
    invoice.line_items_attributes = line_items_attributes

    var app = new Vue({
      el: element,
      data: function(){
        return { invoice: invoice }
      },
      methods: {
        addItem: function(){
          this.invoice.line_items_attributes.push({
            id: null,
            name: "",
            qty: 0,
            price: 0.0,
            total: 0.0,
            _destroy: null
          })
        },

        removeItem: function(index){
          this.invoice.line_items_attributes.splice(index, 1)
        },

        saveInvoice: function(){
          this.$http.post('/invoice', { invoice: this.invoice }).then(response => {
            console.log(response)
            // If save the record we can generate a PFD
          }, response => {
            console.log(response)
          })
        }
      }
    })
  }
})
