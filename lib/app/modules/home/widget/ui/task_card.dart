

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TaskCard extends StatelessWidget {

  

  const TaskCard({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width     : double.infinity,
      margin    : const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding   : const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color   : Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const Icon(Iconsax.cup, color: Colors.white),
          Expanded(
            child : Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [

                  const Text('Comprar Nuevo FFIX', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  const Text('Lorem Ipsum is simply dummy...'),

                  Row(
                    children: [
                      Row(
                        children: const [
                          Icon(Iconsax.category, color: Colors.white, size: 15,),
                          SizedBox(width: 6),
                          Text('Games', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ]
                      ),
                      
                      const SizedBox(width: 20),

                      Row(
                        children: const [
                           Icon(Iconsax.timer_1, color: Colors.white, size: 15,),
                          SizedBox(width: 6),
                          Text('20 Apr. ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ]
                      )

                    ]
                  )

                ]
              )
            )
          ),
          const Icon(Iconsax.timer, color: Colors.white),
        ]
      )
    );
  }
}