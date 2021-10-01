Return-Path: <SRS0=Y+5a=OV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5653C433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 Oct 2021 08:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CAF661AA5
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 Oct 2021 08:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8CAF661AA5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eryVQKEhmDtQ+xksuBDDKGJEFDj2gL21sbL2vkifPFA=; b=THioHsSXkGVufK17Z40a01hBeu
	JNCydT6GlwFQ46BG6nKAEtYgdLZCvCxY1Ail1snRND2pVjbFzVKQuQZXMepbhY3oqQ8pr6JLewZH8
	/EHK6KSb//W5+UCpbVDlf5PKETqXNvBO+hzEK6qvr5kOjsCpCskpC8O+G52xlMCaCBIoikmyPFn8Y
	DYlDqGyl/SgNFoDdS60xby9x9dM4ErTcJ5pqjoM6/rotMVkfJqI5b6W7jiG0U0+S6y6UdhD4xNXBP
	IGmVgGkVT4G1NYhHj4C4mWGEL6jCBoIiM79pkI5It9wQ/pWzfOeEWwxyFeXYKoWHWyLVSfD7pTlrX
	HSaNr94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWDX4-00GyCh-VH; Fri, 01 Oct 2021 08:04:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWDWy-00Gy9h-PG
 for linux-snps-arc@lists.infradead.org; Fri, 01 Oct 2021 08:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633075471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RgbMOii1S0zNC4XfQSp0PtfslNwqAcBT4JkfYppI8hA=;
 b=VDytWw6F4KAuH2KvGyaaLUDIBg+ZDZAu7jUR/3DQ+pbTsGpxHTKqTjhIonZBLuYfK+uxl5
 0ht2hAXgN2nLqIQMRImsmD8c8txwSDpyKdrnyGP+2f8TP2AAzCA94mH4FVtJkyYPJA774/
 64H1blaVoxRRPKi5bDYt3ezYmjauQUo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-yaJ204nSNxieicbtSmYzNw-1; Fri, 01 Oct 2021 04:04:28 -0400
X-MC-Unique: yaJ204nSNxieicbtSmYzNw-1
Received: by mail-wr1-f72.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so2533297wrv.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 01 Oct 2021 01:04:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=RgbMOii1S0zNC4XfQSp0PtfslNwqAcBT4JkfYppI8hA=;
 b=lgwszLR3DiGInWhOyDOKQIvyYDoH2Sdl2KZZO2TqcqPOzWPgZXnVEL5AaZfCToko14
 Hs7XcN2o7QTOu/oK9HOQUa3ZP6pDp/FDMM+qLRvkMMg/a/ACZ/BAK2tOMO2lsjaMTUOx
 LFqz3/DIXyBRn6uqGj6LI+6qbde7oLFlogUHNEmkvpW9yNUaEbDpMCBMIt674kDCs+hg
 KO/kEpBKjxNdgPz/P4BRqjMt5flI2OIDlsmkZ5UJP3KK40Nolpyn+BPHTyHLHJmK8pmD
 XP8hJr9e5F/ydznny4ywaDoVr4SVc3PxDRBHIOwhd0h1ebEGpH8edZ1FyoeWds6nRgqU
 muWw==
X-Gm-Message-State: AOAM532SO0bRJK0o/0mvE2vO2ExRTur8oO6idRG0Bq2efmgG3BNqmkPZ
 daM03IMeFQ3IybT3B3m7LRix4a9pOXT/rXIEMhJD6VjunlpPwP2bm7AEDB+1J9eG/XYgGCs+oRN
 nvX6NuV3PcMDE+aeey85PZG77NtYRUhlV
X-Received: by 2002:a1c:f310:: with SMTP id q16mr3156058wmq.145.1633075467037; 
 Fri, 01 Oct 2021 01:04:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy09IiCKfFi33tOU52HzJrT7VrbqrMf/P7p34oNrrEfUQJ/n90uGLajbxmxEo4tDXieDpGReQ==
X-Received: by 2002:a1c:f310:: with SMTP id q16mr3156030wmq.145.1633075466790; 
 Fri, 01 Oct 2021 01:04:26 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c64da.dip0.t-ipconnect.de. [91.12.100.218])
 by smtp.gmail.com with ESMTPSA id z17sm5132732wrr.49.2021.10.01.01.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 01:04:26 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>,
 Jianyong Wu <Jianyong.Wu@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-snps-arc@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-mm@kvack.org, kexec@lists.infradead.org
References: <20210927150518.8607-1-david@redhat.com>
 <20210927150518.8607-4-david@redhat.com> <YVSW3uuu7mIcJMm3@kernel.org>
 <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
 <YVYqdN7MFdzBlCVm@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <0d6c86ba-076b-5d4b-33a8-da267f951a85@redhat.com>
Date: Fri, 1 Oct 2021 10:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVYqdN7MFdzBlCVm@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_010432_908128_9D19D1F9 
X-CRM114-Status: GOOD (  38.56  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 30.09.21 23:21, Mike Rapoport wrote:
> On Wed, Sep 29, 2021 at 06:54:01PM +0200, David Hildenbrand wrote:
>> On 29.09.21 18:39, Mike Rapoport wrote:
>>> Hi,
>>>
>>> On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
>>>> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
>>>> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
>>>> like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
>>>> regions to add to the vmcore for dumping in the crashkernel via
>>>> for_each_mem_range().
>>> Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
>>> and MEMBLOCK_DRIVER_MANAGED?
>>> Unless I'm missing something they both mark memory that can be unplugged
>>> anytime and so it should not be used in certain cases. Why is there a need
>>> for a new flag?
>>
>> In the cover letter I have "Alternative B: Reuse MEMBLOCK_HOTPLUG.
>> MEMBLOCK_HOTPLUG serves a different purpose, though.", but looking into the
>> details it won't work as is.
>>
>> MEMBLOCK_HOTPLUG is used to mark memory early during boot that can later get
>> hotunplugged again and should be placed into ZONE_MOVABLE if the
>> "movable_node" kernel parameter is set.
>>
>> The confusing part is that we talk about "hotpluggable" but really mean
>> "hotunpluggable": the reason is that HW flags DIMM slots that can later be
>> hotplugged as "hotpluggable" even though there is already something
>> hotplugged.
> 
> MEMBLOCK_HOTPLUG name is indeed somewhat confusing, but still it's core
> meaning "this memory may be removed" which does not differ from what
> IORESOURCE_SYSRAM_DRIVER_MANAGED means.
> 
> MEMBLOCK_HOTPLUG regions are indeed placed into ZONE_MOVABLE, but more
> importantly, they are avoided when we allocate memory from memblock.
> 
> So, in my view, both flags mean that the memory may be removed and it
> should not be used for certain types of allocations.

The semantics are different:

MEMBLOCK_HOTPLUG: memory is indicated as "System RAM" in the 
firmware-provided memory map and added to the system early during boot; 
we want this memory to be managed by ZONE_MOVABLE with "movable_node" 
set on the kernel command line, because only then we want it to be 
hotpluggable again. kexec *has to* indicate this memory to the second 
kernel and can place kexec-images on this memory. After memory 
hotunplug, kexec has to be re-armed.

MEMBLOCK_DRIVER_MANAGED: memory is not indicated as System RAM" in the 
firmware-provided memory map; this memory is always detected and added 
to the system by a driver; memory might not actually be physically 
hotunpluggable and the ZONE selection does not depend on "movable_core". 
kexec *must not* indicate this memory to the second kernel and *must 
not* place kexec-images on this memory.


I would really advise against mixing concepts here.


What we could do is indicate *all* hotplugged memory (not just 
IORESOURCE_SYSRAM_DRIVER_MANAGED memory) as MEMBLOCK_HOTPLUG and make 
MEMBLOCK_HOTPLUG less dependent on "movable_node".

MEMBLOCK_HOTPLUG for early boot memory: with "movable_core", place it in 
ZONE_MOVABLE. Even without "movable_core", don't place early kernel 
allocations on this memory.
MEMBLOCK_HOTPLUG for all memory: don't place kexec images or on this 
memory, independent of "movable_core".


memblock would then not contain the information "contained in 
firmware-provided memory map" vs. "not contained in firmware-provided 
memory map"; but I think right now it's not strictly required to have 
that information if we'd go down that path.

>   
>> For example, ranges in the ACPI SRAT that are marked as
>> ACPI_SRAT_MEM_HOT_PLUGGABLE will be marked MEMBLOCK_HOTPLUG early during
>> boot (drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()). Later, we
>> use that information to size ZONE_MOVABLE
>> (mm/page_alloc.c:find_zone_movable_pfns_for_nodes()). This will make sure
>> that these "hotpluggable" DIMMs can later get hotunplugged.
>>
>> Also, see should_skip_region() how this relates to the "movable_node" kernel
>> parameter:
>>
>> 	/* skip hotpluggable memory regions if needed */
>> 	if (movable_node_is_enabled() && memblock_is_hotpluggable(m) &&
>> 	    (flags & MEMBLOCK_HOTPLUG))
>> 		return true;
> 
> Hmm, I think that the movable_node_is_enabled() check here is excessive,
> but I suspect we cannot simply remove it without breaking anything.

The reasoning is: without "movable_core" we don't want this memory to be 
hotunpluggable; consequently, we don't care if we place kexec-images on 
this memory. MEMBLOCK_HOTPLUG is currently only active with "movable_core".

If we remove that check, we will always not place early kernel 
allocations on that memory, even if we don't care about ZONE_MOVABLE.

> 
> I'll take a deeper look on the potential consequences.
> 
> BTW, is there anything that prevents putting kexec to hot-unplugable memory
> that was cold-plugged on boot?

I think it depends on how the platform handles hotunpluggable DIMMs or 
hotunpluggable NUMA nodes. If the platform ends up indicates such memory 
via MEMBLOCK_HOTPLUG, and "movable_core" is set, memory would be put 
into ZONE_MOVABLE and kexec would not place kexec-images on that memory.

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
