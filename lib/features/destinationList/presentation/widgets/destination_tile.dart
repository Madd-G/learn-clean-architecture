import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/destination.dart';

class DestinationWidget extends StatelessWidget {
  final DestinationEntity? destination;
  final bool? isRemovable;
  final void Function(DestinationEntity destination)? onRemove;
  final void Function(DestinationEntity destination)? onDestinationPressed;

  const DestinationWidget({
    Key? key,
    this.destination,
    this.onDestinationPressed,
    this.isRemovable = false,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(
            start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: destination!.image!,
              imageBuilder: (context, imageProvider) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.08),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  ),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    child: const CupertinoActivityIndicator(),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Padding(
                padding: const EdgeInsetsDirectional.only(end: 14),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    height: double.maxFinite,
                    child: const Icon(Icons.error),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.08),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      destination!.destinationName ?? '',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: 'Butler',
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),

                    // Description
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          destination!.address ?? '',
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),

                    // Datetime
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          destination!.location!,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _buildRemovableArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildRemovableArea() {
    if (isRemovable!) {
      return GestureDetector(
        onTap: _onRemove,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Icon(Icons.remove_circle_outline, color: Colors.red),
        ),
      );
    }
    return Container();
  }

  void _onTap() {
    if (onDestinationPressed != null) {
      onDestinationPressed!(destination!);
    }
  }

  void _onRemove() {
    if (onRemove != null) {
      onRemove!(destination!);
    }
  }
}
