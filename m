Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4B8C64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 09:11:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A2322245
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 09:11:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bsRbc+xJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A2322245
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pLgZRf6k5nwj5f8pEkU151FpfNZmXQlZXMw+T5UBOzI=; b=bsRbc+xJ5B1pUcDCkDUMgLe9B
	+U68x8xs3gKG9hlyzttqnDK60pL1B5GR6JQ2/kbxf4oIQmzP2ud6dgCQ6lA6oQ4vCd4UF23ka54TR
	wXG7uwoW2wjq/nR5GM4Fa5ftynZWiRIXrip3BWZInqMLyNh/5OH6RsZO8pycJIQCaVS1CmkY20UoF
	lLjCU6fD2nMvWmM7sEQ5Ziao73RY2kwV/M8B/x0VxN8eb7rEexsm+9v4j5yWeeI+NJ1p09GiPHozI
	SoDdkh8ulz1AK/L3/jxry1db67CjSfa7rxLVUlL32aF+u458CHMJlkE5RTSLh7VqaxO1pLxmovmCf
	9grl9DViQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk1gm-0001KS-0X; Tue, 01 Dec 2020 09:11:12 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk1gg-0001IN-6W; Tue, 01 Dec 2020 09:11:10 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kk1gY-003MrK-Et; Tue, 01 Dec 2020 10:10:58 +0100
Received: from p57bd9091.dip0.t-ipconnect.de ([87.189.144.145]
 helo=[192.168.178.139]) by inpost2.zedat.fu-berlin.de (Exim 4.94)
 with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1kk1gX-000Ce2-UF; Tue, 01 Dec 2020 10:10:58 +0100
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
Date: Tue, 1 Dec 2020 10:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201117062316.GB370813@kernel.org>
Content-Language: en-US
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 87.189.144.145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_041106_405335_E2EDEEEB 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike!

On 11/17/20 7:23 AM, Mike Rapoport wrote:
>> Apologies for the late reply. Is this still relevant for testing?
>>
>> I have already successfully tested v1 of the patch set, shall I test v2?
> 
> There were minor differences only for m68k between the versions. I've
> verified them on ARAnyM but if you have a real machine a run there would
> be nice.

I have just built a fresh kernel from the tip of Linus' tree and it boots
fine on my RX-2600:

root@glendronach:~# uname -a
Linux glendronach 5.10.0-rc6 #6 SMP Tue Dec 1 04:52:49 CET 2020 ia64 GNU/Linux
root@glendronach:~#

No issues observed so far. Looking at the git log, it seems these changes haven't
been merged for 5.10 yet. I assume they will be coming with 5.11?

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
