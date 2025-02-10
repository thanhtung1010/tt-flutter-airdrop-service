import 'package:flutter/material.dart';

class FiltersWidget extends StatelessWidget {
  final VoidCallback onSearch;
  final VoidCallback onReset;
  final Widget? customFilters;
  final Widget? customButton;

  const FiltersWidget({
    super.key,
    required this.onSearch,
    required this.onReset,
    this.customFilters,
    this.customButton,
  });

  @override
  Widget build(BuildContext context) {
    bool isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            isSmallScreen
              ? Column(
                children: [
                  _buildRightSide(),
                  SizedBox(height: 10),
                  _buildLeftSide(),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildRightSide(),
                  _buildLeftSide(),
                ],
              ),
          ],
        ),
      ),
    );
  }

  // Left side with default buttons + custom widget
  Widget _buildLeftSide() {
    return Row(
      children: [
        IconButton(
          onPressed: onSearch,
          icon: Icon(Icons.search)
        ),
        SizedBox(width: 4),
        IconButton(
          onPressed: onReset,
          icon: Icon(Icons.restore)
        ),
        if (customButton != null) ...[
          SizedBox(width: 4),
          customButton!,
        ],
      ],
    );
  }

  // Right side with filter inputs + custom widget
  Widget _buildRightSide() {
    return Row(
      children: [
        if (customFilters != null) customFilters!,
      ],
    );
  }
}
