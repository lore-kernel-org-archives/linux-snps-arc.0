Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B07CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Dec 2021 20:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ROyPxVWIqAwTsnfJYFDfp14J/NAzfrI4KIZz/htRkM=; b=jpX8dHA+n5NhYU
	KeZ5TkWO+NjooCyz5w4CctZDC3Kq/j8SYHjKwBI0gJF3keGieduURACU+V+qQ3bQE+62oBNpdYkPU
	7UP5/g7SsIJ2O6iAGUljH2c1q9l9iMkGC98sqtKYjrvf21LMxY+mrcAwL4svDKTmUFBG0yFuNH9r+
	/zGaJAwKuqJUNXGMxcidR3mOMwo7SDEr8AvaGAj1djR4HQ+jjUvlW7adOkm5N9oM1FAojBB8MFwGk
	3lHW4P9ZiZBeUnbTb+D3WG1BgnjrgSSrbJEE+alI2Mo83xMl1cYbYB6iPwDWuWWsOq5LlGg6+fFp+
	nZwQuIONBOcRA/l3Ropg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msWPb-00A4iE-B3; Wed, 01 Dec 2021 20:41:07 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msWPV-00A4hC-Nh
 for linux-snps-arc@lists.infradead.org; Wed, 01 Dec 2021 20:41:06 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 4D9E32C0;
 Wed,  1 Dec 2021 20:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4D9E32C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1638391259; bh=GzVkJDus5eS8xCbKaVDWRKmErJ7yBcN+YxqWxXCJnGs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bEQ0LfuwqMHhWpvbD3T5Ec3sNQkJDFSLii+AOTO58+0blGGRQjk3w1AQW3KbqbsCH
 zjd80QaUyXPX7kBkKvwkc+FDWtFV3Iy+Sl5DRNJF4jr1ExdZ1+UMF97zmbC5tKWPMY
 XpeavMENxckqK2cmDkPpYsrLh0rYy2aO0fXLj95F4AzqAo9us4cDoAtYvL72uvrwkb
 UB0kXuvUPm+eLRFFYuR3DxsrH+miu+Q6wejBCMgYCJG2V/XBifPNmriAmei3N3fzhL
 iohSyksjsnduC7Ck1S1r6kh0hGFnIkYO56y0gLyqCsDV/6qtBUfb13E0tGqGzoB48I
 nuqrw8Hg5dlsQ==
From: Jonathan Corbet <corbet@lwn.net>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>, Randy Dunlap
 <rdunlap@infradead.org>, Vineet Gupta <vgupta@kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] docs: Add documentation for ARC processors
In-Reply-To: <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
References: <20211112065059.7273-1-abrodkin@synopsys.com>
 <87fsresjx6.fsf@meer.lwn.net>
 <PH0PR12MB5401E55A4E8D1D7360C02E68A1689@PH0PR12MB5401.namprd12.prod.outlook.com>
Date: Wed, 01 Dec 2021 13:40:58 -0700
Message-ID: <875ys8kqhx.fsf@meer.lwn.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_124101_797298_91751963 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:

>> This manual requires registration (with a fair amount of information
>> required) to get.  That should at least be mentioned if we can't find a
>> less obnoxious version out there.
>
> Well, I'm afraid that's the best we may get as of now. I wish is was available
> with no registration whatsoever, but at least it could be easily had now by
> wide audience.
>
> Anyways, I'm wondering what kind of mention do you think is appropriate here?
> Somehting like: "note, registration is required"?

Something like that would be helpful, I think, yes.

>> > +Building the Linux kernel for ARC processors
>> > +############################################
>> > +
>> > +The process of kernel building for ARC processors is the same as for any other
>> > +architecture and could be done in 2 ways:
>> > +
>> > +1. cross-compilation: process of compiling for ARC targets on a development
>> > +host with a different processor architecture (generally x86_64/amd64).
>> > +
>> > +2. native compilation: process of compiling for ARC on a ARC platform
>> > +(hardware board or a simulator like QEMU) with complete development environment
>> > +(GNU toolchain, dtc, make etc) installed on the platform.
>> 
>> These enumerated lists would render a lot more pleasantly if you
>> actually formatted them as RST enumerated lists - with lines after the
>> first indented.
>
> Indeed, I'm much more used to Markdown and there it works ;)
> So should I send a re-spin with fixed version?

I applied the patch, so please send improvements on top of that.

Thanks,

jon

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
