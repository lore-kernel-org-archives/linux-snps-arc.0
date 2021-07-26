Return-Path: <SRS0=do6u=MS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F55EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Jul 2021 08:56:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E483260F53
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Jul 2021 08:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E483260F53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=881vVVS4T7Fng6aK7zZ/CC+sO2dMrkaMqHnPd0GPfvc=; b=us8Q3tS3p0DE1MfSv2N8EXgET4
	j8NNTTN27JyJoDNLefbxFQIYwHT/xUfZXPXhEjK2oPlMqb5d15cK+9HwKzByiG/wdDvavDg54F5rD
	RgNHtw3PCgYt2TyeHXgXP5QKxqmxlV4jBLtIuJb+aOIYtgNNTFaFCVB8gxDkd9FJuqxCJmSUBbfxr
	HIGCd1cRSnuxSExRKzDnZ3iyhGxo57AeOJQg092GiAKCa7Cxn5PFuzHaWq1ANlP0M3ZkywE/jRCsW
	VDlr4P4y1dsxBzwjAA98ynij6TAlrrP3zCQAVLiYuFvUtkAVB8Kw0ME9erLiV03RGEQx69Xy4Y0Tl
	xQy8FrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wP6-00AJLa-ED; Mon, 26 Jul 2021 08:56:04 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wP3-00AJJh-76; Mon, 26 Jul 2021 08:56:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627289727;
 bh=WkWs2yjbuB7rMLWgvsxBc4/Z976NwWWIEDiSOgTN55I=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=E7jOP/dwH1+3UHoNaSbTx2XDQRxAN5F8L7jEpZmRIgESVf9ne0KM7xfW0ObhH8vkT
 ABXz8dsUiPiO1dwu3MUYUkMNesxVe0Yk5ji3YVzpNZGn/BfZ3uPtXbOes3Ed2hx1cN
 YAlh6MXWhHfFt0OlfJQAeFIRfElfQswmhjdssuBY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.59] ([92.116.128.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHG8g-1lugpy469A-00DFk8; Mon, 26
 Jul 2021 10:55:27 +0200
Subject: Re: [PATCH v3 9/9] asm-generic: reverse
 GENERIC_{STRNCPY_FROM,STRNLEN}_USER symbols
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Brian Cain <bcain@codeaurora.org>, Chris Zankel <chris@zankel.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Linus Walleij <linus.walleij@linaro.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michal Simek <monstr@monstr.eu>, Richard Weinberger <richard@nod.at>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, uclinux-h8-devel@lists.sourceforge.jp
References: <20210722124814.778059-1-arnd@kernel.org>
 <20210722124814.778059-10-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
Message-ID: <b89d9932-7498-edd2-0369-227ce17bcba6@gmx.de>
Date: Mon, 26 Jul 2021 10:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722124814.778059-10-arnd@kernel.org>
Content-Language: en-US
X-Provags-ID: V03:K1:kdIeDnlaRuH2T6rYGVMcZI1y8GGtOS/nCSrzGPNZ3OUQY5MU47B
 5CBoPs+/Yybus1lp3BFr1TFHG7JdG2o5Hk/+MOXzTPoZvzj/YZ/cz0YWZjRIVcPlnwe88YM
 WDlT2nlwI7uszkXCcyqKqCixlXZhA3YZdT580q2WrQJMaYRDbQNCq2HCRZf0EsBm4LR75i3
 BHhYUoKB70JevsBXEfP+w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t7OOfsjhfdM=:cPmtJv3NWFJm9d/RuoNb+/
 Ou4Bbj6nA8Q23PNuEt+UCFyyraXkWNdlDMwrkBg6/uFHrFY5gewiHslDKOPvwvPZ4QoBcNuDT
 8bh8p1CqRqBNHsASvkEW+aJWm7j9TC8kTFOu4TqiRXvTqGCDIZxCBbYk3f4lF/KmzuVlpr0Du
 E6C7Nzp0ITty3fkhOUAZ7wUXr3fIAjaxGFOEos4Wax/D/96hS2a6wrxxpOtPW0jHf8YZSnTSW
 +ywaHc1qBSckC2nArgXnml3LmH/tsv8FS8c8fz5NB7haNTuVB2mlV0T1Vj4jUSZlFG40Gwuh+
 Qrs/0c1D57oh8kEVO16Yxgp9ls6PVKeBRbaiSNH6omxp9zKHT1mUSR523x7yUMgOqnIwFCvQm
 Me+mKB5Jup/it+POvsUV+NExWuf1EU1Q6I3aIWzXucxBkrfZ8sNKgj9/ZrGi4s5deIMCkm4jD
 WaWwGwylSRBIWBpcPDH0v0u+AcyK6mHWrvLsuJgLfVQZ5MtFihjQ7IUGh9k2b0pB61aSNX6Ja
 aUKIE1tfVrDqxg6QPCBlKIYbOglFx3Of70KtfGF8Y17PfXUSYPqmIeU6f6rsvThB99NrFTtHg
 UuNp7rNTATgACIDJvcPung6RI/RTVo7xMb5KnslJrTw9tyOlK9c2QiI4u0GzBTGGhI8sB+xEQ
 jccA0NGTg7ONUDj1qS8/RGqjPZqiAucjd60cgrD9OBfKsNeFwDYDDjlfg22beeNTYtcRRGsU/
 cwWoNxvInEN7Q5ES0wOBjYvb7zo04AJRFD5+mjf/YJhtmoSZpHSjHRKmLuE8O3jTocx33DzoS
 l3W3ypaoWe9H/E/AKrwcePngCJNADVH5MLl1qd1trF5lrhH1mRqrIzmYoSrFiehrBph0pN1BH
 etTVyfghR0rL7vavgTnKsreSpMyl3W3flVYYrL1VFrOZOaFlu4o/STXYiDOLTuais8R4uHZ9m
 rx7BDIdUVUu2cfGdCxzn72+/DIL+wTIkX3hYLkdhLbb0ILsnNCRr3C7E2s1DdY1NyblFsxj3/
 LgqPcJqCPQLSSnri/QeHDporOJ+A2BTzG1/uoMuWJameE3z/JlSz+68zDXDri1c2g98Ia8/zM
 mym0OeKhYLafNgyhfcmFszob94nhnmC8BqG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_015601_631653_3D411FE1 
X-CRM114-Status: GOOD (  12.87  )
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

On 7/22/21 2:48 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most architectures do not need a custom implementation, and in most
> cases the generic implementation is preferred, so change the polariy
> on these Kconfig symbols to require architectures to select them when
> they provide their own version.
>
> The new name is CONFIG_ARCH_HAS_{STRNCPY_FROM,STRNLEN}_USER.
>
> The remaining architectures at the moment are: ia64, mips, parisc,
> s390, um and xtensa. We should probably convert these as well, but
> I was not sure how far to take this series.

Acked-by: Helge Deller <deller@gmx.de> # parisc

Thanks!
Helge

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
