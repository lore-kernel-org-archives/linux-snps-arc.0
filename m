Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABDACCD188
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Oct 2025 08:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP4Oyby4tV8xa7KUYrtJDzs027hPZCFPmHkgVMvEpuI=; b=y+AmBsPdnvNO1j
	DLizhM3wGt1Brqq/G17nmJ9h8r3MDGYQn55ijQtHR7zpwmjJrrT3GGfZUdP9biKwH0J8mJZKCJVvH
	gCfI+bCL6MQNEY7nAlpTZ0nFFYkq2rlCUoJMHH162cpdApzGWN2KLidVLOMt+X2/ZBOOqT+2K98rc
	hXNQboN5sBOF8XZKYpX1zg+uIVd0rdkANM9Sk5q6LINxNQt4axZ75zMsVf2P2kiZGoTipjueiza87
	uX2gtsxIm73HhKAzVIIdZV3daBRyWqyza/Z2R/gmUNu2Gvr8F+mMFpUUlGv+396KOpkwhIF3/qksV
	RkOevnxXS9V/Xmu8qMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFV-00000005Xo4-3ZO7;
	Thu, 09 Oct 2025 08:43:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFU-00000005XnD-08fV
	for linux-snps-arc@bombadil.infradead.org;
	Thu, 09 Oct 2025 08:43:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=; b=lhRx7b65upfq2OhBVrjQeT82hk
	dCPCJxtL3eGW+njIYgW/vjqnesHkER9S+UniHu7zybnX0+FGjR27PJG5F0SOrmC/DSBxYeNiDXVh7
	I9BO61En/UZV/WabQV4KEFN/R2W+WsXmBkTfuIYML+OPS/XglUFJhgzNKr+bXF3w6SJeyro5fkEIC
	gqMdmcS/SUGPL6B4TpL50ivfnHq5MwoYqxe7inOXNZmbU5UKAG7sB3MKKsEbHWTzDoDWtTX7gGEId
	9mHalwjQwZVm+fZkfk5C7Qun1zkuNNDWuH2qIciPSkvQPFSJAIpH7JRf//8O35+f3E1ffSKX4QkOw
	4bghUYrg==;
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6mFO-00000001JK5-35xD
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Oct 2025 08:43:42 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-71d603a269cso7057117b3.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Oct 2025 01:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759999416; x=1760604216; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=C6BOkosjlHa5VkwhZfh4j+ONXYtGY72PJsF2FjfJap1x36ou7RfHimBT88ck1DLlus
         d44YI4r6TgGfy+qaA1Y5pBcm7gj+imB3YubptbNvteMRFJdsy0vrmDDZz9uvnJfuaeld
         Uc5T5tfGMzNWl9HXcb+a63wHTkS43zEfdIQ3zdWg8M4DZBFrws0DaUoSnhuES65wDk6h
         4mrTN/xHnZU3YojS5vfnAJvTy9UFCp91iREx3Ub4DK13pGEpX41A8Jb8iC6R7EOCTKe+
         WoYnb7d1dxF+vt2+NDAdsyOmVWLxvvRK+KPOzAngAXE/CZ+oTlgQPLSD0DdlchQ1KuSi
         FGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999416; x=1760604216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOmLRNO4yxmZr9GGl+AUsKcQlyU35gqHSeHKaWhtPwQ=;
        b=Z9cRaKsqTVVvne06CpdBUYoJBq+ZHQzBQKTIFYeSmTP7owPxV7uqnDotTCl3EOJtGu
         QJlf2pg1HCYvpuVpg/hHigSJ03oOl1Wyw5zNtJkPAHIvMs7i788S+2WWybjEXEKGEc4l
         gdRpmpX1nyTjz4UKsKWCq+5m/sTOol6PDHkKSYO5z1HGesMeBA/izKws09fFkLKGkZMb
         CuIEO+IdsmtqJARA5L70j/XAXWgwFt01qCxodAT2JDu/+do9mRf9WnWX6G9329M8Hxkc
         kN8YgLC4ClBXO+ZM0/Ui+OEB/j2bdu3hzrk+ekyXfOK99HDEpCkJ0OOCNAPqpAxlqdoD
         V29Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOcAnpGCUbJp55NT/i1djD/LvQgD+sKroCwaNHsv8XU8ahVn8B218AtBGgjuabZ3uJiS9/Z4a8QclyhX8qqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaOIlv718vb7AJGhZpbFzcmFLBkDIy/gMXpFvnXzJiDN9YIThi
	wUHaAg6d6beIvFIf+Gi3zDcdPLRpYYZpJrZOw2+m3hHOzBtU7kdZ/PDMgLTCnkdyN12fsFgVvN6
	TXvCSGUIP4e+MGQwhvTljEYYPojPsCLI=
X-Gm-Gg: ASbGnctO6j4H4QY6t26mtvElQsNUO8jjWuwGWiHR/KZait5Z8zTdtAuM6TPZ12xbBQd
	ea8JBRDcrYm/32es6QZ68qFX7E1LILbaWXDtwVuVcYTZUJd56bgsBGRX4D4ALjcDCjAPXRgLnqq
	EMvSA8iIvvZy1worJ1lh75SdEDhydhUJOjqMAYPWdZ7nSsqE8/ZC/LiDLwRF7jcSY0PHoL+awtp
	98MqjHx8jCERs3CE9cKk9OmV2895/9t6EqKD/TMuQ==
X-Google-Smtp-Source: AGHT+IHqqt7JHMFlL5DEMxX8/4fuWke6o7x715NV65SuEycRYAp5q8y3uA9SPr+Cccah/gPAgRpT2LfWBS7AmxUm0/4=
X-Received: by 2002:a05:690e:146:b0:635:4ece:20a9 with SMTP id
 956f58d0204a3-63ccb91d5e0mr4410660d50.46.1759999415603; Thu, 09 Oct 2025
 01:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250918152830.438554-1-nschichan@freebox.fr> <20250918195806.6337-1-safinaskar@gmail.com>
 <CAHNNwZAzecVcJXZmycX063-=p-M5jVkfStfgYVKJruOFo7y9zg@mail.gmail.com>
 <CAPnZJGDwETQVVURezSRxZB8ZAwBETQ5fwbXyeMpfDLuLW4rVdg@mail.gmail.com> <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
In-Reply-To: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
From: Askar Safin <safinaskar@gmail.com>
Date: Thu, 9 Oct 2025 11:42:59 +0300
X-Gm-Features: AS18NWA7xuLtf9pobQHoPGHI9uL9SjsnEaZg-EuuD52zBO81KbUszIYBPPZ5wRY
Message-ID: <CAPnZJGAp-wG+9wDmmisfpxvFbRtXkG-RipAuZe=fi1BWy-3G-Q@mail.gmail.com>
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
To: Nicolas Schichan <nschichan@freebox.fr>
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_094339_107378_F240EFB8 
X-CRM114-Status: GOOD (  12.85  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgMjIsIDIwMjUgYXQgNToyOeKAr1BNIE5pY29sYXMgU2NoaWNoYW4gPG5zY2hp
Y2hhbkBmcmVlYm94LmZyPiB3cm90ZToKPiA+IFRoZW4gaW4gU2VwdGVtYmVyIDIwMjYgSSB3aWxs
IGZ1bGx5IHJlbW92ZSBpbml0cmQuCj4KPiBJcyB0aGVyZSBhIHdheSB0byBmaW5kIHNvbWUga2lu
ZCBvZiBtaWRkbGUgZ3JvdW5kIGhlcmUgPwoKSSBzdGlsbCBwbGFuIHRvIGZ1bGx5IHJlbW92ZSBp
bml0cmQgaW4gU2VwdGVtYmVyIDIwMjYuCk1haW50YWluZXJzIHdpbGwgZGVjaWRlIHdoZXRoZXIg
dGhleSB3aWxsIG1lcmdlIG15IHBhdGNoc2V0LgpZb3UgbWF5IHRyeSB0byBjb252aW5jZSB0aGVt
LgoKPiBJIGNhbiBzZW5kIGEgcGF0Y2ggZm9yIHRoYXQgYnV0IGZpcnN0IEkgbmVlZCB0byBzb3J0
IG91dCBteSBTTVRQCj4gaXNzdWVzIGZyb20gdGhlIG90aGVyIGRheS4KCklmIHlvdSBzdGlsbCBo
YXZlIG1haWwgaXNzdWVzLCBjb25zaWRlciBhcHBseWluZyBmb3IgQGxpbnV4LmRldiBlbWFpbCwK
dGhleSBhcmUgZnJlZSBmb3IgTGludXggZGV2cyAoIGh0dHBzOi8vbGludXguZGV2LyApLgoKQWxz
bywgSSBqdXN0IHRyaWVkIHRvIHRlc3Qgd2hldGhlciB5b3VyIHVzZSBjYXNlIGlzIHN0aWxsIHN1
cHBvcnRlZCBpbgptYWlubGluZSAoaS4gZS4gdW5jb21wcmVzc2VkIGluaXRyZCB3aXRoIHJvb3Q9
L2Rldi9yYW0wKS4KSXQgdHVybmVkIG91dCB0aGF0IG9uIG1vZGVybiBrZXJuZWxzIHlvdSBuZWVk
IHRvIGVuYWJsZQpyZWNlbnRseSBpbnRyb2R1Y2VkIENPTkZJR19CTEtfREVWX1dSSVRFX01PVU5U
RUQgdG8KbWFrZSB0aGlzIHdvcmsuClNvLCBtYWtlIHN1cmUgdG8gZW5hYmxlIHRoaXMgd2hlbiB1
cGdyYWRpbmcga2VybmVsLgoKLS0gCkFza2FyIFNhZmluCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
