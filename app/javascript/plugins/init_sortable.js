import Sortable from 'sortablejs';
import Rails from '@rails/ujs';

const initSortable = () => {
  const list = document.querySelector('.itemchosens');

  if (!list) {
    return;
  }

  const sortable = Sortable.create(list, {
    onEnd: (evt) => {
      const order = { order: sortable.toArray() };

      Rails.ajax({
        url:  list.dataset.updateOrderUrl,
        type: "PATCH",
        data: new URLSearchParams(order).toString(),
        success: function(data) {},
        error: function(data) {}
      })
    }
  });
};

export { initSortable };
