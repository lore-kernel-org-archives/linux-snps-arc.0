Return-Path: <SRS0=rPSH=7D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10090C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 May 2020 22:27:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE22A206F6
	for <linux-snps-arc@archiver.kernel.org>; Thu, 21 May 2020 22:27:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u51Bd0Bp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMVpK+nW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE22A206F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXHfng5TISEqAVVfCGQ6GCEJ3i4fA0XhSsJaArRNvmA=; b=u51Bd0BpjaMdlw
	sgQsbnjOvYjmu2veSqFyK5sinD9ogavoSi/+6+bmve9Qiq31Oxj3H63lwJQAvK17wtQEPr2nNC8e2
	v6WaNoTSjjEpk7bq/3byGftY/PcbOgCfdQQwVT0QV9sE4mW06BLrgHYRHKc9sZTgMsp8FCgzzA/68
	qFLPuxhxP6Jrl8C7cYwlOwp/Dg1S1AuXq+/rmk4/FGiu1Na+A8soSCx3t3C2dJyzm6WImnNNVRLjZ
	+mp+BT9LjjbKHpROnM/R5dhoKaYInIv4rMDm0zncsrX9ZJP8BgNdnVKQS75HRu0hBLJZCO0V+z2R+
	rbBW74O6sBwWZKtYdyww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbtf3-0004QW-4s; Thu, 21 May 2020 22:27:33 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbteo-0004Et-Pn; Thu, 21 May 2020 22:27:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id b190so4176367pfg.6;
 Thu, 21 May 2020 15:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C9teSBt5EFyL1ooxgNCTVzsMAlO1Yd+6XPJLe2ev2bM=;
 b=QMVpK+nWSHcA81lvQeUl04CxBHtTvmTyPcurTeqVanxsrZbAG7fMkPC/fSyIww9prW
 1qyZ/1nTChkdNMgcbC+yJ3rqgzDehQ2pR3IoQVjj/iXSIiBGDMOCOUa8lo81yvRCUsOQ
 6O0+TJwPVJihSh3zXqTxc5goY48Tyv/Ht1nO1WBxfBdWspqGV/Nguth1iKsjt2fKoQEH
 0paOX6yIiGXSvgXQ8iBmFJNKytqOgPrqA+w3JJTp3BG4lDD0D07WyPuOzAFrrrcIzSBk
 SXb3q5n4lVVPNcy0mvogTLq8iglp4xtl1wbyc8yz6rEbxY5ljW+SBkyFSyiKHBQ+/LvU
 4udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C9teSBt5EFyL1ooxgNCTVzsMAlO1Yd+6XPJLe2ev2bM=;
 b=ImzB4iHPLPD+VEBBpm0BrJ+aBRZ9iGjte+PNxbtz5768J6HZpRwumQoqmpbs/Bw2ye
 kX/JMk/VvNAJpuTIjUr/4KNbMo2lFRdFizQVzrHepvKW5Stndbwg92B6X9bWAY3C/7o6
 Hsu1Mzhie1a2rrM/2fXolaRP+rmwj8Tc5OpneuKHF4G8xVCS5AXeIP/043k/lLg0aDV5
 TLIW8V5G/5hHWNiv4O87hHWrrDh+1I6V2iyVMXw/zUUowhu/CoSIabvoBGLSLphKR73n
 csVR7bkzaAbhwM5sHP5LD4J2cXiMzc3W0uZuahPGfYpfLiuvJBGrN86H7vPbCWYn2c8J
 coVw==
X-Gm-Message-State: AOAM532BvO8ZxSwN9SL1BMOEtm3zr+jfahu/ryqgxEahoexPAapFDfJs
 3ia3hn6bZrH/5EZUpAloKY4=
X-Google-Smtp-Source: ABdhPJyt5FT8n2wXgmcyHuRPT+yQ5XeQuDpZmuQoitUaabYeW/PwhBp8SoAi3eJOaOMOAdtD5FW/QQ==
X-Received: by 2002:a63:ae0f:: with SMTP id q15mr10607558pgf.72.1590100038028; 
 Thu, 21 May 2020 15:27:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p6sm4754021pgl.26.2020.05.21.15.27.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 15:27:17 -0700 (PDT)
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
To: Ira Weiny <ira.weiny@intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <9088585b-b52f-39ad-1651-53cfc0abd714@roeck-us.net>
Date: Thu, 21 May 2020 15:27:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_152718_859329_44446B24 
X-CRM114-Status: GOOD (  19.88  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 5/21/20 10:42 AM, Ira Weiny wrote:
> On Thu, May 21, 2020 at 09:05:41AM -0700, Guenter Roeck wrote:
>> On 5/19/20 10:13 PM, Ira Weiny wrote:
>>> On Tue, May 19, 2020 at 12:42:15PM -0700, Guenter Roeck wrote:
>>>> On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
>>>>> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
>>>>>> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
>>>>>>> From: Ira Weiny <ira.weiny@intel.com>
>>>>>>>
>>>>>>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
>>>>>>> enables when vaddr is not in the fixmap.
>>>>>>>
>>>>>>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
>>>>>>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
>>>>>>
>>>>>> microblazeel works with this patch,
>>>>>
>>>>> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
>>>>> patch for Guenter as well.
>>>>>
>>>>> Sorry about that Guenter,
>>>>
>>>> No worries.
>>>>
>>>>> Ira
>>>>>
>>>>>> as do the nosmp sparc32 boot tests,
>>>>>> but sparc32 boot tests with SMP enabled still fail with lots of messages
>>>>>> such as:
>>>>>>
>>>>>> BUG: Bad page state in process swapper/0  pfn:006a1
>>>>>> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
>>>>>> flags: 0x0()
>>>>>> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
>>>>>> page dumped because: nonzero mapcount
>>>>>> Modules linked in:
>>>>>> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
>>>>>> [f00e7ab8 :
>>>>>> bad_page+0xa8/0x108 ]
>>>>>> [f00e8b54 :
>>>>>> free_pcppages_bulk+0x154/0x52c ]
>>>>>> [f00ea024 :
>>>>>> free_unref_page+0x54/0x6c ]
>>>>>> [f00ed864 :
>>>>>> free_reserved_area+0x58/0xec ]
>>>>>> [f0527104 :
>>>>>> kernel_init+0x14/0x110 ]
>>>>>> [f000b77c :
>>>>>> ret_from_kernel_thread+0xc/0x38 ]
>>>>>> [00000000 :
>>>>>> 0x0 ]
>>>>>>
>>>>>> Code path leading to that message is different but always the same
>>>>>> from free_unref_page().
>>>
>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
>>> sparc 32 bit...
>>>
>>> Its a long shot but could you try reverting this patch?
>>>
>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
>>>
>>
>> That is not easy to revert, unfortunately, due to several follow-up patches.
> 
> I have gotten your sparc tests to run and they all pass...
> 
> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> Build reference: v5.7-rc4-17-g852b6f2edc0f
> 

That doesn't look like it is linux-next, which I guess means that something
else in linux-next breaks it. What is your qemu version ?

Thanks,
Guenter

> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> 
> Is there another test I need to run?
> 
> Ira
> 
> 
>>
>> Guenter
>>
>>> Alternately I will need to figure out how to run the sparc on qemu here...
>>>
>>> Thanks very much for all the testing though!  :-D
>>>
>>> Ira
>>>
>>>>>>
>>>>>> Still testing ppc images.
>>>>>>
>>>>
>>>> ppc image tests are passing with this patch.
>>>>
>>>> Guenter
>>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
