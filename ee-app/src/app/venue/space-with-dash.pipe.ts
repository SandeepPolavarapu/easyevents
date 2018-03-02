import { Pipe, PipeTransform } from '@angular/core';
@Pipe({name: 'spacewithdash'})
export class SpaceWithDashPipe implements PipeTransform {
  transform(value: string): string {
    return value.split(' ').join('-');
  }
}