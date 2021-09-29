Return-Path: <SRS0=cQ7c=OT=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6CB9C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A54F6142A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Sep 2021 16:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7A54F6142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/aBZVrs96iD5ecnm9VrRontaqwb25nlwO8/aj2XzbQ=; b=R9HJmuZJ2uVNFxIirZP9MIlh4E
	9uoO5qAmG5mbWkXRTICHu01nXrTP3Wc0SeQ5r+URfks3oDIyXJGp0nJy4PSqExGky2xDV9GTEJ4Qs
	G1tBrCS1dRpDbr8o3Ciffb/ajzVYLgXczQ3fG8283waZXHQJWcYhWZQu4yqW8476MuQxLQn3lkzgW
	l+CCp0aT+cH5Kz4ywOhp7MQBz541hjHn2ZDPboYI1Bk/ySz8+P05yXau48jhJ0BzUsKpajRQAP3dy
	/Aj1fMVPM1vrq8m389iX95W0+e1P2B2FclLc3OLXHRAjaNK0EpA7BPZViq1EjErguujA1ny+uNbG3
	GWiasARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVcqT-00Bsqf-2h; Wed, 29 Sep 2021 16:54:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVcqP-00BspD-Oi
 for linux-snps-arc@lists.infradead.org; Wed, 29 Sep 2021 16:54:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632934448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wz7/LCBNzU2qEx/p5MvqtYMtlnh6TSWHAxM6fGc3vyI=;
 b=AZI0/QgFD2B5O6XPH6sEgh7RXjoFSpaESNqU0i6Mib7FolWxBW4P9xqfLct23zR3aZ1pFS
 H7FfQckMsvb0LRmacL8ZNaVH/HddSA2CYjjQaB5gfn1dx2tAbxb4t58oH09xBtpikyWNMB
 qJlZi6GqnkxEeTRX/y+eKfH70hbNVD4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-UFyRLhA6PtOn7QWf6br2uQ-1; Wed, 29 Sep 2021 12:54:05 -0400
X-MC-Unique: UFyRLhA6PtOn7QWf6br2uQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so1513018wmc.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 29 Sep 2021 09:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wz7/LCBNzU2qEx/p5MvqtYMtlnh6TSWHAxM6fGc3vyI=;
 b=18pPKYni4nVDv+RVL1MOhoWhaaYLQtf7LPFiu0dslyX92CbW+/VGGc81qZrSqF/1Yd
 MeQSV/NbHEXES5C3FnlZ6pW/V3GTG7ZWHjtzGjjDIgHq8ids1+EOgll7iRXwiX9VSMxo
 y5pPHn3x9CWKvCVCoPDXYgIdWYPNgNkPcVWwaRWPLy5CQCzcdBstG93qwbjZDiP4McDy
 OARefEAgOZIYmurHK+ZvoDZAc7RCQvgvr42RQq8eCIrkqcXTvTtUzQBFKQOuIrIKdGlS
 K6/vmMifLkcFme2xq197HFPEhhM9+9XdgSCe+g48b7C4cj8/vFKWurfbzth9e3T4esUA
 g8Iw==
X-Gm-Message-State: AOAM531LZfVrkAQ2iD84jjKU4WRw41Zt4PjcloQ58rVZRcren6cYPrgk
 9xab9F8tXLua6FJfZ5BR0QajiYgEDiKb+u/9gv43EQWPHHNTw/CjKgZ5oDC5tG2DrsRNWejKZOl
 ss30A7E8c63FJFfh0IqXswILnPBX0DbLU
X-Received: by 2002:adf:de86:: with SMTP id w6mr1061909wrl.287.1632934443886; 
 Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGkSiAZ0xz7kEyNo1HVkBwp/AkS+PaM+h+PvcslevGOtwequrlIC8Rb0h3s3NmIdNpczjkgw==
X-Received: by 2002:adf:de86:: with SMTP id w6mr1061866wrl.287.1632934443713; 
 Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
Received: from [192.168.3.132] (p4ff23c3b.dip0.t-ipconnect.de. [79.242.60.59])
 by smtp.gmail.com with ESMTPSA id
 m4sm465862wrx.81.2021.09.29.09.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 09:54:03 -0700 (PDT)
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v1 3/4] memblock: add MEMBLOCK_DRIVER_MANAGED to mimic
 IORESOURCE_SYSRAM_DRIVER_MANAGED
Message-ID: <830c1670-378b-0fb6-bd5e-208e545fa126@redhat.com>
Date: Wed, 29 Sep 2021 18:54:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVSW3uuu7mIcJMm3@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210929_095409_887827_CE5CD571 
X-CRM114-Status: GOOD (  23.78  )
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

On 29.09.21 18:39, Mike Rapoport wrote:
> Hi,
> 
> On Mon, Sep 27, 2021 at 05:05:17PM +0200, David Hildenbrand wrote:
>> Let's add a flag that corresponds to IORESOURCE_SYSRAM_DRIVER_MANAGED.
>> Similar to MEMBLOCK_HOTPLUG, most infrastructure has to treat such memory
>> like ordinary MEMBLOCK_NONE memory -- for example, when selecting memory
>> regions to add to the vmcore for dumping in the crashkernel via
>> for_each_mem_range().
>   
> Can you please elaborate on the difference in semantics of MEMBLOCK_HOTPLUG
> and MEMBLOCK_DRIVER_MANAGED?
> Unless I'm missing something they both mark memory that can be unplugged
> anytime and so it should not be used in certain cases. Why is there a need
> for a new flag?

In the cover letter I have "Alternative B: Reuse MEMBLOCK_HOTPLUG. 
MEMBLOCK_HOTPLUG serves a different purpose, though.", but looking into 
the details it won't work as is.

MEMBLOCK_HOTPLUG is used to mark memory early during boot that can later 
get hotunplugged again and should be placed into ZONE_MOVABLE if the 
"movable_node" kernel parameter is set.

The confusing part is that we talk about "hotpluggable" but really mean 
"hotunpluggable": the reason is that HW flags DIMM slots that can later 
be hotplugged as "hotpluggable" even though there is already something 
hotplugged.

For example, ranges in the ACPI SRAT that are marked as 
ACPI_SRAT_MEM_HOT_PLUGGABLE will be marked MEMBLOCK_HOTPLUG early during 
boot (drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()). Later, 
we use that information to size ZONE_MOVABLE 
(mm/page_alloc.c:find_zone_movable_pfns_for_nodes()). This will make 
sure that these "hotpluggable" DIMMs can later get hotunplugged.

Also, see should_skip_region() how this relates to the "movable_node" 
kernel parameter:

	/* skip hotpluggable memory regions if needed */
	if (movable_node_is_enabled() && memblock_is_hotpluggable(m) &&
	    (flags & MEMBLOCK_HOTPLUG))
		return true;

Long story short: MEMBLOCK_HOTPLUG has different semantics and is a 
special case for "movable_node".

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
