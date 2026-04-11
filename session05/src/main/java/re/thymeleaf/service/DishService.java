package re.thymeleaf.service;




import org.springframework.stereotype.Service;
import re.thymeleaf.model.Dish;

import java.util.ArrayList;
import java.util.List;

@Service
public class DishService {

    public List<Dish> getAllDishes() {
        List<Dish> list = new ArrayList<>();

        list.add(new Dish(1, "Phở bò", 50000, true));
        list.add(new Dish(2, "Bún chả", 40000, false));
        list.add(new Dish(3, "Cơm tấm", 45000, true));

        return list;
    }
    public Dish getDishById(int id) {
        List<Dish> list = getAllDishes();

        for (Dish d : list) {
            if (d.getId() == id) {
                return d;
            }
        }
        return null;
    }
}
