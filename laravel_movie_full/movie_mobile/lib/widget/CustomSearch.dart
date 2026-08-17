import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    super.key, required this.onTap,
  });
  final VoidCallback onTap;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 55,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 55,
                  width: 55,
                  child: Center(child: Icon(Icons.search,color: Colors.grey,size:30,)),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.transparent,
                            child: Text('Search...',style: TextStyle(fontSize: 15,color: Colors.grey,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          child: Row(
                            children: [
                              Container(
                                height: 25,
                                width: 1.5,
                                color: Colors.grey,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.tune,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}