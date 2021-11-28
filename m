Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA47AC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 05:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RtZxgh6NUBMNZ8DSfP9Gd48SdTqz8hIwZHVGlIJULqM=; b=LiY0j9hZhAXS/k
	AxNXVmLjLsqT0msTLjACO88SpMTRZF/pVJaLGz9ZlzegqG9pccfqn1Q2JsqWPFpeRgt1EoEvGF0pd
	nMUhNXj1WGHNjGs2AwB7YvokCR0iBqDhLnBsYixLR35qYMmAPA7jbRgPJ3fSXZyiJk0t/32IfGQBh
	RyIyDTGgXHQfdvxvoFDmrikmwbRDQs6zn2/z0QH0n8cvK9pVVeVR2MR8VpoRC5LW2LzNK1ZPriTDV
	b/ON0PzIb1dDRfAJuzwfVzo2HM+qa6P+3szERBDWdiemNtM/TXXotLK2mKdAEJ1FpQHYNaRG2Az6Z
	5CnKKz6iit+JyfS54J1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrCS4-00F5HQ-8g; Sun, 28 Nov 2021 05:10:12 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrCRp-00F5Ci-1O; Sun, 28 Nov 2021 05:09:58 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1xPH1FPPz4f;
 Sun, 28 Nov 2021 06:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638076195; bh=oUZYFQUmcrcLe+khMfxoyii9jHAFHFy8/qX4bg6ScHU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JnSDJhb2/wFE1+K5BEKj3l92hAUJYMSiQfvzp+ZlCATcD11ALuloHBV8agVwt/D5m
 6xO5KVkS6ds9BhnvUIzgpE+GOAlwIHTeHWZUDQLRlCqXrEtKOnOW/XLCrUHjRtkpA+
 s0Zgh/IC7vC3LAsHBRaM+HBKV7zFjzE+7UOTFGbokGiHbpHQX7rXsKsJST3S+JBeda
 2sNRV1hDCglR6IzM+jk8O4GqGLON53RjQjMI9dzQcjIf9OmuQDCgevPa74eYKb6N8i
 DO41zxtTZnaEDqhBVPy9rAwcuQc/n0JQGJK3acFZNX84ZqpVMLYjA4M2TxieYk4Vj5
 b6s4KzCtg6yrQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 06:09:53 +0100
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 7/9] lib/cpumask: add
 num_{possible,present,active}_cpus_{eq,gt,le}
Message-ID: <YaMPIXUYuP1Q5FrQ@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-8-yury.norov@gmail.com>
 <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YaMME60Jfiz5BeJF@qmqm.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_210957_274279_46DE26D5 
X-CRM114-Status: GOOD (  14.03  )
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, Nov 28, 2021 at 05:56:51AM +0100, Micha=B3 Miros=B3aw wrote:
> On Sat, Nov 27, 2021 at 07:57:02PM -0800, Yury Norov wrote:
> > Add num_{possible,present,active}_cpus_{eq,gt,le} and replace num_*_cpu=
s()
> > with one of new functions where appropriate. This allows num_*_cpus_*()
> > to return earlier depending on the condition.
> [...]
> > @@ -3193,7 +3193,7 @@ int __init pcpu_page_first_chunk(size_t reserved_=
size,
> >  =

> >  	/* allocate pages */
> >  	j =3D 0;
> > -	for (unit =3D 0; unit < num_possible_cpus(); unit++) {
> > +	for (unit =3D 0; num_possible_cpus_gt(unit); unit++) {
> =

> This looks dubious. The old version I could hope the compiler would call
> num_possible_cpus() only once if it's marked const or pure, but the
> alternative is going to count the bits every time making this a guaranteed
> O(n^2) even though the bitmap doesn't change.

Hmm. This code already unnecessarily calls num_possible_cpus() multiple
times. Since it doesn't change after early init I would suggest just
calling it once here.

Best Regards
Micha=B3=A0Miros=B3aw

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
