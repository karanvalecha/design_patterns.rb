module Observer
  def unsubscribe(observable)
    observable.delete_observer(self)
  end

  def subscribe(observable)
    observable.add_observer(self)
  end
end
