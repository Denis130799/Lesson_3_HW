//
//  main.m
//  Lesson_3_HW
//
//  Created by Denis on 15.08.17.
//  Copyright © 2017 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const cityNameKey = @"cityName";
static NSString *const carShopKey = @"carShop";
static NSString *const brandNameKey= @"brandName";
static NSString *const modelsKey = @"models";
static NSString *const carModelKey = @"carMode";
static NSString *const carParametersKey = @"carParameters";
static NSString *const carColorKey = @"carColor";
static NSString *const carPriceKey = @"carPrice";

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        NSArray *cityNames = @[@"Харьков", @"Киев", @"Винница", @"Ужгород", @"Суммы"];
        NSArray *carShops = @[@"Toyota", @"Nissan", @"Ford", @"Fiat", @"Honda", @"Dodge"];
        NSArray *colors = @[@"Белый", @"Черный", @"Синий", @"Крвсный", @"Серый"];
        
        NSArray *ToyotaModels = @[@"Camry", @"Corolla", @"Prius", @"Land Cruiser", @"RAV4"];
        NSArray *NissanModels = @[@"GT-R", @"Juke", @"Leaf", @"Qashqai", @"X-Trail"];
        NSArray *FordModels = @[@"Fiesta", @"Focus", @"Mustang", @"Edge", @"Escape"];
        NSArray *FiatModels = @[@"Albea", @"Bravo", @"Croma", @"Doblo", @"Ducato"];
        NSArray *HondaModels = @[@"Accord", @"CR-V", @"Pilot", @"Civic", @"Domani"];
        NSArray *DodgeModels = @[@"Avenger", @"Challenger", @"Changer", @"Viper", @"Dart"];
        
        NSArray *carModelsByShops = @[ToyotaModels, NissanModels, FordModels, FiatModels, HondaModels, DodgeModels];
        
        
        NSMutableDictionary *kharkivauto = [NSMutableDictionary dictionary];
        [kharkivauto setObject:[NSArray arrayWithObjects:ToyotaModels[0], ToyotaModels[1], ToyotaModels[2], nil] forKey:(NSString*)carShops[0]];
        [kharkivauto setObject:[NSArray arrayWithObjects:NissanModels[0], NissanModels[1], NissanModels[2], nil] forKey:(NSString*)carShops[1]];
        NSMutableDictionary *kievauto = [NSMutableDictionary dictionary];
        [kievauto setObject:[NSArray arrayWithObjects:FordModels[0], FordModels[1], FordModels[2], nil] forKey:(NSString*)carShops[2]];
        [kievauto setObject:[NSArray arrayWithObjects:FiatModels[0], FiatModels[1], FiatModels[2], nil] forKey:(NSString*)carShops[3]];
        NSMutableDictionary *vinnicaauto = [NSMutableDictionary dictionary];
        [vinnicaauto setObject:[NSArray arrayWithObjects:HondaModels[0], HondaModels[1], HondaModels[2], HondaModels[3], HondaModels[4], nil] forKey:(NSString*)carShops[4]];
        [vinnicaauto setObject:[NSArray arrayWithObjects:DodgeModels[0], DodgeModels[1], DodgeModels[2], DodgeModels[3], DodgeModels[4], nil] forKey:(NSString*)carShops[5]];
        NSMutableDictionary *uzhorodauto = [NSMutableDictionary dictionary];
        [uzhorodauto setObject:[NSArray arrayWithObjects:ToyotaModels[3], ToyotaModels[4], NissanModels[3], nil] forKey:(NSString*)carShops[0]];
        [uzhorodauto setObject:[NSArray arrayWithObjects:NissanModels[4], FordModels[3], FordModels[4], nil] forKey:(NSString*)carShops[1]];
        NSMutableDictionary *summiauto = [NSMutableDictionary dictionary];
        [summiauto setObject:[NSArray arrayWithObjects:NissanModels[3], NissanModels[4] , nil] forKey:(NSString*)carShops[2]];
        [summiauto setObject:[NSArray arrayWithObjects:FiatModels[3], FiatModels[4], nil] forKey:(NSString*)carShops[3]];
        
        
        //        NSInteger price = (arc4random()%20000)+10000;
        //        NSDictionary *param = @{carColorKey : @"Grey", carPriceKey : @(price)};
        //        NSDictionary *model = @{carModelKey : [ToyotaModels[1] stringValue], carParametersKey : param};
        //        NSNumber *priceOfModel = (NSNumber*)model[carParametersKey][carPriceKey];
        
        
         NSMutableArray *ukraineCitiesArray = [NSMutableArray array];
        
        
        for (NSInteger currentCityIndex = 0; currentCityIndex  < cityNames.count; currentCityIndex++)
        {
            NSString *currentCityName = (NSString*)cityNames[currentCityIndex];
            NSMutableArray *shopsOfCurrentCity = [NSMutableArray array];
            
            
        
        
            for (NSInteger carShopIndex = 0; carShopIndex < carModelsByShops.count; carShopIndex++)
            {
                NSString *currentShopName = (NSString*)carShops[carShopIndex];
                NSArray *currentShopModels = (NSArray*)carModelsByShops[carShopIndex];
                NSMutableArray *carModels = [NSMutableArray array];
            
        
            
                 for (NSInteger modelIndex = 0; modelIndex < currentShopModels.count; modelIndex++)
                {
                    NSInteger price = 10000 + (arc4random()%20000);
                    NSInteger randomColorIndex = arc4random()%colors.count;
                    NSString *color = (NSString*)colors[randomColorIndex];
                    NSDictionary *currentModelParametrs = @{carColorKey : color, carPriceKey : @(price)};
                    NSString *nameofmodel = (NSString*)currentShopModels[modelIndex];
                    NSDictionary *currentModel = @{carModelKey : nameofmodel, carParametersKey : currentModelParametrs};
                    [carModels addObject: currentModel];
                }
                NSLog(@"%@", carModels);
                NSDictionary *currentShopDictionary = @{carShopKey:currentShopName, modelsKey:carModels};
                [shopsOfCurrentCity addObject:currentShopDictionary];
            }
            NSLog (@"%@", shopsOfCurrentCity);
            NSDictionary *currentCityDictionary = @{cityNameKey : currentCityName, brandNameKey : shopsOfCurrentCity};
            [ukraineCitiesArray addObject:currentCityDictionary];
        }
        NSLog(@"\nresult:\n%@", ukraineCitiesArray);
    
        
    }
    return 0;
}
