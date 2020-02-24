Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968C9C35673
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 02:49:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61BE220658
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 02:49:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ppk/pQuz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adlGMnFj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61BE220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vbTo7lR8os7tgqTZMTYv5l1S96qE9JaKMbt04xKt+ms=; b=Ppk/pQuzFUmeul
	S0gDFehQBs6w7OSLySziMyOvEh7ckRpvgR2C1+rEKlLMjy2lkwKkEeVVxbn3qmYC/LonGFyI5/ywg
	zI3Nbht3GtsREWjILLHvf3TSZwf1p8makthRacrUcASY6tMZ0kW2sAhc9U2T7JtZ+KjMTQol4OV0m
	PZlQv9exV92XsUFv9TUqnsqXA5PPHhQvWxYBIbyP/WbhyVVl2ukeDEji7YnZIE5OIEikaug64CuQ2
	W+HwXFvh9JPAadzY6CTPvbhcwFysBU+/OyBWP+R1N+ljTeC4ZD0Jjz08N8GRn3Cdg9Fdc0SREeEhU
	QUS9YfEqMhoxsG1WfQEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j63no-0000yg-23; Mon, 24 Feb 2020 02:49:00 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j63nk-0000yG-VP
 for linux-snps-arc@lists.infradead.org; Mon, 24 Feb 2020 02:48:58 +0000
Received: by mail-pg1-x542.google.com with SMTP id z12so4353024pgl.4
 for <linux-snps-arc@lists.infradead.org>; Sun, 23 Feb 2020 18:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xsz8xL2wJJTN4qKvVnxibwQhu1sj9znZn/PM2AywkQc=;
 b=adlGMnFjGtQW3IbdLbTjBUmeSMxqqu6fEnOT1++/qxKKYw/n1cNKPzPxSAQP4TRxpJ
 oVP03ZHwPuZHXay/1lLsMe9bps7ZzsQ9P9ZIp/kIcF/iST8ZSwTbOmxOMNNGJ40BOH08
 9nAnIfYB/EW5o/idX0G5xC+BhhIiAoSngzfeICotPlpI7mII4SUBJG8NYTmoTyd+/o1e
 QUW2TwdOpV7XkF1aUwuYjaqb8SBUB0kJK0VQWoIpJJAcVvLB5nGT55sdXoQYZvEiGlin
 LakfwZfAb0lqTm3JjnbEG6yl8HhrwrG+2Bxi5rh/Xu8UIIyBfSTyYBwdWuEJRqY58GPE
 lsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xsz8xL2wJJTN4qKvVnxibwQhu1sj9znZn/PM2AywkQc=;
 b=pEt/AucqwXwzmjDa6cyGkiPnQMf7DpHjhBfaELeBHJH9+swlenpigJTgV2Z5bMWYg7
 E86OC+lzp2/Ui4rQTP3eEl4VPZjUeEBKrajaDPIaP5yCuXUg9OVynke/goPg78bbIeSq
 DcoPzdqnUKbr7EiQP3UdvkLOU+LYknK6KcQzVxGeAsQsjJdaMeoztkDzxCUApVXe6VJl
 tCZ6js30ljsQefZsHy2jG6pG8RXBOB4p/H6HCYDBi/9mhfyEkYsKuD0Q2ltZ/isprwPc
 uKD5nvAk4yBGsPPUrJ0ntwqsmZ9z2pdMr20xVKPn8pOW7Xo0DoMsMhUfX9iuG84pmMud
 RWVQ==
X-Gm-Message-State: APjAAAVrR4DVnCWgCy3ZPVG+dtEk15eLl4LLhYRG7hp7fUWmw8mnb/9C
 n//5Ua+XJtQ1edGGG4lszsLJAw==
X-Google-Smtp-Source: APXvYqyBsttEWyjWJvFTyMlc9Sfoa7H7+tN/zSEhKXdlkysLm4tCpiJ0cBl3XCM9zTupEpGX+om8sQ==
X-Received: by 2002:aa7:94a4:: with SMTP id a4mr48876286pfl.178.1582512534904; 
 Sun, 23 Feb 2020 18:48:54 -0800 (PST)
Received: from localhost ([223.226.55.170])
 by smtp.gmail.com with ESMTPSA id z4sm10080968pfn.42.2020.02.23.18.48.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Feb 2020 18:48:54 -0800 (PST)
Date: Mon, 24 Feb 2020 08:18:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: switching ARC to 64-bit time_t (Re: [RFC v6 07/23] RISC-V: Use
 64-bit time_t and off_t for RV32 and RV64)
Message-ID: <20200224024852.75jketuczmeptadr@vireshk-i7>
References: <CAKmqyKMyf2psPp+-EHoidvbPbSXv0=dP26GjVQnT5BUriLc1gA@mail.gmail.com>
 <alpine.DEB.2.21.2002120123230.3988@digraph.polyomino.org.uk>
 <CAKmqyKOgFRfMOws_-48GqMnuS3ygmN9A4DzLg6UtEjRXVoM82A@mail.gmail.com>
 <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220103716.2f526933@jawa>
 <CAK8P3a1nte0nGMw8_aeS__iJsTvsSGYYuKivAYBdiGH-GjVGew@mail.gmail.com>
 <20200220141451.3fa2fc3f@jawa>
 <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2qLZBAuP-YT2=KZoP+V23TAKvw5W1_2t7rEr2RobLsWw@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_184857_042323_BB6B5703 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Florian Weimer <fweimer@redhat.com>, Helmut Grohne <helmutg@debian.org>,
 GNU C Library <libc-alpha@sourceware.org>, Viresh Kumar <vireshk@kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Lukasz Majewski <lukma@denx.de>,
 Zong Li <zongbox@gmail.com>, debian-arm@lists.debian.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 "Maciej W. Rozycki" <macro@wdc.com>, Alistair Francis <alistair23@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 20-02-20, 15:44, Arnd Bergmann wrote:
> On Thu, Feb 20, 2020 at 2:15 PM Lukasz Majewski <lukma@denx.de> wrote:
> > > On Thu, Feb 20, 2020 at 10:37 AM Lukasz Majewski <lukma@denx.de>
> > > > > On Thu, Feb 20, 2020 at 12:11 AM Lukasz Majewski <lukma@denx.de>

> > > There is also some work
> > > in Linaro to ensure that LTP tests the low-level syscall interfaces
> > > in both the time32 and time64 variants.
> >
> > Interesting. Is this work now publicly available?
> 
> I think this is currently in the planning stage, but once patches
> are available, they would be posted to the ltp mailing list. Viresh
> should have more details on this.

What you said is correct Arnd. It is in very early stage of planning
right now, no guarantees on when will we start working on it as of
now.

-- 
viresh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
