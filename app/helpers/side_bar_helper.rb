module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Главная страница',
      :icon => 'home',
      :controller => :welcome, 
      :action => :index
    }
    result << {
      :name => 'Администрирование',
      :icon => 'users',
      :children => [
      {:name => 'Пользователи',
       :controller => :users, :action => :index,
       :icon => 'users',
       :class => 'long'},
      {:name => 'Добавление',
       :controller => :users, :action => :new,
       :icon => 'user-plus'},
      {:name => 'Роли',
       :controller => :roles, :action => :index,
       :icon => 'align-center',
       :class => 'long'},
    ]} 
    result << {
      :name => 'База данных',
      :icon => 'list-alt',
      :children => [
      {:name => 'Список стеллажей',
       :controller => :stacks, :action => :index,
       :icon => 'th-list'},
      {:name => 'Список товаров',
       :controller => :items, :action => :index,
       :icon => 'shopping-cart',
       :class => 'long'},
      {:name => 'Поиск товаров',
       :controller => :items, :action => :search,
       :icon => 'search'}
    ]} 
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
