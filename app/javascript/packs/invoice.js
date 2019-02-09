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

    function calculate_invoice(){
      var subtotal = 0
      invoice.line_items_attributes.forEach( function(line_item) { 
        subtotal += line_item["total"]
      })
      invoice.subtotal = subtotal
      invoice.tax = (subtotal * 5) / 100
      invoice.total = invoice.subtotal + invoice.tax

    }

    function calculate_row(index){
      var qty = invoice.line_items_attributes[index]["qty"]
      var price = invoice.line_items_attributes[index]["price"]
      invoice.line_items_attributes[index]["total"] = qty * price
    }

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

        calculate: function(index){
          calculate_row(index)
          calculate_invoice()
        },

        removeItem: function(index){
          this.invoice.line_items_attributes.splice(index, 1)
          calculate_invoice()
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
