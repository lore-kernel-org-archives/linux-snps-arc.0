From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 14 Jan 2016 10:51:32 +0000
Subject: [PATCH v5 1/2] PCI support added to ARC
References: <cover.1452611234.git.jpinto@synopsys.com>
 <24c9b782dfade515bbed20ce75d85200a00a2e66.1452611234.git.jpinto@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E84C55@us01wembx1.internal.synopsys.com>
 <4314331.TCtUIaZPTC@wuerfel> <56977B80.2040600@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E84DC7@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 14 January 2016 04:12 PM, Joao Pinto wrote:
> Hi,
>
> On 1/14/2016 10:22 AM, Arnd Bergmann wrote:
>> On Thursday 14 January 2016 05:26:58 Vineet Gupta wrote:
>>>> +/*
>>>> + * We don't have to worry about legacy ISA devices, so nothing to do here
>>>> + */
>>>> +resource_size_t pcibios_align_resource(void *data, const struct resource *res,
>>>> +                             resource_size_t size, resource_size_t align)
>>>> +{
>>>> +     return res->start;
>>>> +}
>>> Doesn't this have to be EXPORT_SYMBOL_xxx as well given that the call
>>> (setup-res.c) can build as module ?
>> I only see a caller in drivers/pci/setup-res.c, and that is never part of a
>> loadable module.
>>
>>>> +
>>>> +void pcibios_fixup_bus(struct pci_bus *bus)
>>>> +{
>>>> +}
>>>> +EXPORT_SYMBOL(pcibios_fixup_bus);
>>> EXPORT_SYMBOL_GPL ?
>>>
>>> As a seperate enhancement, it would be nicer if these 2 functions are defined weak
>>> in common code. That would make basic PCI support almost arch independent !
>> I agree, that would be ideal. An easy way to do this would be to add
>> them as __weak functions in drivers/pci/, similar to how we handle
>> a lot of the other pcibios_* functions.
>>
>> A somewhat nicer method would be to have callback pointers in struct
>> pci_host_bridge, and call those when they are non-NULL so we can
>> remove the global pcibios_* functions from the API. That would also
>> bring us a big step closer to having PCI support itself as a loadable
>> module, and it would better reflect that those functions are really
>> host bridge specific rather than architecture specific. When you use
>> the same host bridge on multiple architectures, you typically have
>> the same requirements for hacks in there, but each architectures may
>> need to support multiple host bridges with different requirements.
> Since we will be constantly improving the driver and the core itself, I suggest
> that this functions be made __weak and in an update we can turn it struct
> pointers just like Arnd suggested. Is this good for you?

There is no point in making it weak, w/o a fallback version in generic code. For
this series, I suggest you just remove the straggler EXPORT_SYMBOL and respin.

And then as a follow up to make them weak (and hence eliminate the scattered
definitions all over). And then add as callbacks as suggested by Arnd.

Thx,
-Vineet

>
>> 	Arnd
>>
> Thanks
> Joao
>
>
>
