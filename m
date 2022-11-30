Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39A34C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 30 Nov 2022 02:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObXxy7LIwBsr1aXclzpaqqMmROwV+Vhed4ahlyFkRlM=; b=MDb/jmhd/Ebeqw
	vC7dMeo0/1VknmadP9/OuvS9mps+FzCu+zvTaIxfF+CWtz4ol6kavwmVkiDPH6ZnYN4f2Gk/DegEd
	5SwL9XBXWwbVSgmmlFmv0EI+4Y9Z3f8jRAHyezaoVnuoLvF0fJwLrvBImYpAegbeX8+WM7m8ataMa
	NDn7jh7ZBZ4Zg8zK3eBaeKokhBj99iDmzh2UB5mE/zfXWVvXgCjfCoK76TqOX6aC94eMrNQWHrHQl
	sLjZbMh7NHkDLhlDEKqFbqTKHjBjUz0qk2NyiFmKZNDqzrJz9U76d1aLRXP5e9zXZwE4V4YuHVL4G
	+0Y8HpZYxpy40d3VqHRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CZQ-00C3dt-6e; Wed, 30 Nov 2022 02:11:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0CZN-00C3ZW-CC
	for linux-snps-arc@lists.infradead.org; Wed, 30 Nov 2022 02:11:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CA346194E;
	Wed, 30 Nov 2022 02:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341A5C433B5;
	Wed, 30 Nov 2022 02:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux.dev; s=korg;
	t=1669774284; bh=FzLTewJgji2/Qi2LCsULztASZayYGkgvEwZ08IfH7kA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zkev0tsTZW2kLqnu53B6PZl/UyKJnPyPhSN8hnkg8RKdU6pfms1eFr1G2Gd1qqPsI
	 M4BFvP5i84XUELalsbgM+P9Vehlwsb8RR/6bXodvKzFw4yVhM2sxkpCIZFzkgAGh98
	 BvL/MK0nTdtWMC/y63qsC1e8WYGM+3z/GFDuCPPo=
Message-ID: <1a37cede-b77c-3548-9e3c-470127359a4d@linux.dev>
Date: Tue, 29 Nov 2022 18:11:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/2] scripts: Add "|" operator support to glibcpp's
 parsing
Content-Language: en-US
To: Florian Weimer <fweimer@redhat.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: libc-alpha@sourceware.org,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20221118131542.23188-1-shahab@synopsys.com>
 <20221127173825.3106-1-shahab@synopsys.com>
 <20221127173825.3106-2-shahab@synopsys.com>
 <87h6yk1cn6.fsf@oldenburg.str.redhat.com>
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <87h6yk1cn6.fsf@oldenburg.str.redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_181129_491193_1EC0414F 
X-CRM114-Status: GOOD (  10.12  )
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

On 11/27/22 10:21, Florian Weimer via Libc-alpha wrote:
> * Shahab Vahedi:
> 
>>  From the tests point of view, this is a necessary step for another
>> patch [1] and allows parsing macros such as "#define A | B".  Without
>> it, a few tests [2] choke when the other patch [1] is applied:
>>
>> /src/glibc/scripts/../elf/elf.h:4167: error: uninterpretable macro
>> token sequence: ( EF_ARC_MACH_MSK | EF_ARC_OSABI_MSK )
>> Traceback (most recent call last):
>>      File "/src/glibc/elf/tst-glibcelf.py", line 23, in <module>
>>        import glibcelf
>>      File "/src/glibc/scripts/glibcelf.py", line 226, in <module>
>>        _elf_h = _parse_elf_h()
>>                 ^^^^^^^^^^^^^^
>>      File "/src/glibc/scripts/glibcelf.py", line 223, in _parse_elf_h
>>        raise IOError('parse error in elf.h')
>>    OSError: parse error in elf.h
>>
>> [1] ARC: update definitions in elf/elf.h
>> https://sourceware.org/pipermail/libc-alpha/2022-November/143503.html
>>
>> [2]
>> tst-glibcelf, tst-relro-ldso, and tst-relro-libc
>>
>> Signed-off-by: Shahab Vahedi <shahab@synopsys.com>
> 
> This okay and can go in separately, thanks.
> 
> Reviewed-by: Florian Weimer <fweimer@redhat.com>

Committed !

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
