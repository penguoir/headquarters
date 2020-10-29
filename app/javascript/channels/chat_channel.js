import consumer from "./consumer"
import DateHelper from "../packs/date_helper"

document.addEventListener("turbolinks:load", function () {
  const fourth_pathname = window.location.pathname.split('/')[3]
  if (fourth_pathname && fourth_pathname != 'chats') {
    return
  }

  consumer.subscriptions.create({
    channel: "ChatChannel",
    // Resource id is saved under data-resource of the body this is what
    // StackOverflow recommends. So we get the data-resource attribute to
    // identify the channel
    project_id: $('#channel').data("id")
  }, {
    received(data) {
      console.log({ data })

      $('#chats').prepend(`
      <div class="chat container-fluid px-2 py-2 rounded">
        <div class="row justify-content-between">
          <div class="col-auto">
            <b>${data.display_name}</b>
            <span class="ago text-muted">
              ${DateHelper.time_ago_in_words_with_parsing(data.created_at)}
            </span>
          </div>
        </div>

        <div class="row">
          <div class="col-12">
            ${data.body}
          </div>
        </div>
      </div>
      `)
    }
  })
})


