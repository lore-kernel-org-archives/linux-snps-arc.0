Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 904BBFA3753
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Jan 2026 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s4FJ+ckH3ZEhndztF10Oz9Tu1qxR/VfxlorSThQWZG0=; b=L2k2F0la3B0YTd
	uEvk+9m22r+dcd29iPesuLZDjidKYny4G6QYA36r8otjXvM/VdtSux5NooDEzy/91D6DuZQNKJ3kr
	5hzApm38otjKkzj+7EHe7rG+ytEy8OFUBOy9o49daJNNQwmXr2WK3NvvC3g1qsJHbIoAt8ea+CQU3
	YnFi4ORB5XSLcvbXQtZlBiFP2IUo+ntsIyKEDm35H0USLinKGMp+1hWA/xbOIZtPMKNO3rza19g/9
	4se7L6RERa28DPapAq9HueOp2h7wwFhNwzWAJZGIntQARz7iJTqjrFcsGHEtD12ymtyn0L8NJiOvo
	12SeF31VEWjpJEMiOC8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjVN-00000008bjB-3r3E;
	Fri, 02 Jan 2026 18:04:05 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbjVM-00000008bhy-0tBF
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Jan 2026 18:04:05 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4f34f257a1bso10931cf.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 02 Jan 2026 10:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767377042; cv=none;
        d=google.com; s=arc-20240605;
        b=FP+GK+P038JYUv793X81grAMWLrLw1z1cDkhcJUno3/id6hHInt4ZGcG9HYDaSA3pe
         08bV/F9tZpPtftjCdDxMG4Mpk0D/iQzO1IjLGflji2/UrdWMzir0/Ta5xL+bEso8wx2Y
         9JFnP0fbyCREbBFADY19eHqgtlxfs3dCBjSWCfTxkMco+M1U2+qX9QMRyQB83h0MiT/J
         kriVRJpCDuWnTNjIOw3Z1EmO5AuXUCgGbdL2HYWyQIo5LTOIbykgIQKPhz1m5x4VOUVs
         J3cCZMvGZMm4MMnvP4IwIRG8sEH5JN4YLVuOdu4fObz1tpnCShbdulTuUdMHA0Nt8/b4
         ogNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        fh=HOfmQrykaMbyZ1v9M4Wg/s5FdxhGPW9HcFNBq7X1V/U=;
        b=RxgUEMMvLK5W4wUCws7DTp9QvZxCdZPsR+WXuOyzLxztiJuDjbtsOvUTupAd371nZG
         v7EJ2YqAkIXlYG4UyP/eAR19T3+ADdDjyXYyvZLHnmeRAZt/8XNQoODP+TDHkRBFr0K+
         x3xpZCwphTU/6D0iLlnraUEZ+iqAimAVqbaAZVM6+dZezc3+rYm3NNM3n3gOia2pCq+o
         JbndqcAKj+qhUs0qHBQpgZuMd0vI+uBqI0x5XUB0/963svwlyviU8hUppVJFsGQQiTm9
         Pnwl7a5pG8+NDpFBuJEgzqbDFiuOUJz4QuA4+tYpw7gaMq2KPwypEKqKukGr4HOKoXmp
         CAtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767377042; x=1767981842; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        b=MAambTeXZ6vsTdRtk1B1JYcxzaKiquUj9bvhbs9NWK6IRHuCFKhcOOV8TnQ4JYfbXP
         GESKL+4v92CNnNeHl29WH2sjVN2uqhfkrViCgoprrK/oJQekubfNwBXlu/55uRDOFg0Q
         PJSvL4/b3gYGRiWJPU+UO6zIx5fUbCbOPNEKnbgAH9BfDkwnX+GMmEb+J4OkAbvNhlUj
         ML5ZnQeR5569iP4U9kV3wX1jeJYurvPossN7fYP5Aj7KCZnsqpharpeguazSgBIJpTeR
         hyUCXpydZ/FC8cPHfEaA+KgX7rccsPnjLrde+Gj4NeGgAUUFJ3GATTd+43EqwubsJcCD
         Nmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767377042; x=1767981842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VF7Ncw4qUW1QvZXNeYN2PHKmriSnoyG5jmMgiKLYwBI=;
        b=TzmudRTVehl+QwvyCOib+Tp8bO34g2K6AcD8uvjnCtOKzNhudjUCFxm/kMLoDNR+J/
         P54cwRZWsqTCbZHm9+rh+dE4wCiGkheba4j1ptSsC8p5ggyhCH6K68U7FEFR4XmYC1KZ
         jsU3ete0z8n/4sVBeb74UEuFDqv0cVXO5sYGCcGw7NsV3LyRpDHzYjsMnYlFnxEbRdE3
         SOJON3Cf9ZnaV7QJ7mfZZ042ZAKjvyxuECXUl/eQRNc3TFw5SNN9DEDU+XGPM1Dz4/In
         03BKjhGEGUSwWqmhf8/Q5U5fWX2SAiw8yu4fgTmJAMzhDLx+eyJ5doR0gsfuLKk06F29
         Rskw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Z9yQpnyKRtTTfNl17FhyTYjZLY6TK65Sao+Hj7nDRSLb9YiMXicw6p1n2KMwm5Lk6CRa/nn01okihC2agA==@lists.infradead.org
X-Gm-Message-State: AOJu0YySA+ufI0E19A4o5GqviHXwB2FjjtqoAme1325LL10QfnuFSMtq
	fdTmBFLvsctThJyHZR42E7uV9+vd5BwmJuTNIHchaJk9Zp6o01CviTMKfzIBJHcAvhmFCbyqiQv
	UZCGoR4G8z8cyvsMhp9+c+aOnQKmgoE+4S27reJ4L
X-Gm-Gg: AY/fxX4ibi0vyTrIXK2+rlrZw/45INhrvagwKAfnkrp+4Awe7Icc8xGNnGLhjkk43hf
	VU6OFmL2jAwhXtZAbmvJ0QNzslGn1YZikcYOUHV6yMDfBYHLJ/Z3PIa57msA3d95Vjtkmu2icTW
	kSBbZDpWLyCL7aZFIzBMPQO9MosuihxbLu6eHtHgwz62i0p72JM034TZpWAzcH368oRNkLXRsYl
	PUGX7p8D1O5UmDOZLn1yTHiOvlX1KbciWpDDw3NpPBcVwHEntcgUFl3GipU7CDEmpm7EC0=
X-Google-Smtp-Source: AGHT+IE626c1niVbXfJuRnnEKb/XVpUT3xgOsgVHvUYmmAhOToE2K50Gpbsa48xtp+jOGlgqExM/NP3EnDee4koBR/0=
X-Received: by 2002:a05:622a:8016:b0:4fb:e3b0:aae6 with SMTP id
 d75a77b69052e-4fbe3b0ad54mr14392961cf.1.1767377041692; Fri, 02 Jan 2026
 10:04:01 -0800 (PST)
MIME-Version: 1.0
References: <20260102070005.65328-1-rppt@kernel.org>
In-Reply-To: <20260102070005.65328-1-rppt@kernel.org>
From: Frank van der Linden <fvdl@google.com>
Date: Fri, 2 Jan 2026 10:03:49 -0800
X-Gm-Features: AQt7F2qPng5Y0NvX0my5UG4cpefC6iiH19nIvMPHQLdOtt1JmQ_l0Tjv8FxQEzo
Message-ID: <CAPTztWaZZt_ygCDNaDdW9A_TtT1FNZW6hFzyiq2b6_xxMw38gQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/28] arch, mm: consolidate hugetlb early reservation
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alex Shi <alexs@kernel.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>, 
	Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_100404_308695_E5906F6B 
X-CRM114-Status: GOOD (  31.19  )
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

T24gVGh1LCBKYW4gMSwgMjAyNiBhdCAxMTowMOKAr1BNIE1pa2UgUmFwb3BvcnQgPHJwcHRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiAiTWlrZSBSYXBvcG9ydCAoTWljcm9zb2Z0KSIgPHJw
cHRAa2VybmVsLm9yZz4KPgo+IEhpLAo+Cj4gT3JkZXIgaW4gd2hpY2ggZWFybHkgbWVtb3J5IHJl
c2VydmF0aW9uIGZvciBodWdldGxiIGhhcHBlbnMgZGVwZW5kcyBvbgo+IGFyY2hpdGVjdHVyZSwg
b24gY29uZmlndXJhdGlvbiBvcHRpb25zIGFuZCBvbiBjb21tYW5kIGxpbmUgcGFyYW1ldGVycy4K
Pgo+IFNvbWUgYXJjaGl0ZWN0dXJlcyByZWx5IG9uIHRoZSBjb3JlIE1NIHRvIGNhbGwgaHVnZXRs
Yl9ib290bWVtX2FsbG9jKCkKPiB3aGlsZSBvdGhlcnMgY2FsbCBpdCB2ZXJ5IGVhcmx5IHRvIGFs
bG93IHByZS1hbGxvY2F0aW9uIG9mIEhWTy1zdHlsZQo+IHZtZW1tYXAuCj4KPiBXaGVuIGh1Z2V0
bGJfY21hIGlzIHN1cHBvcnRlZCBieSBhbiBhcmNoaXRlY3R1cmUgaXQgaXMgaW5pdGlhbGl6ZWQg
ZHVyaW5nCj4gc2V0dXBfYXJjaCgpIGFuZCB0aGVuIGxhdGVyIGh1Z2V0bGJfaW5pdCBjb2RlIG5l
ZWRzIHRvIHVuZGVyc3RhbmQgZGlkIGl0Cj4gaGFwcGVuIG9yIG5vdC4KPgo+IFRvIG1ha2UgZXZl
cnl0aGluZyBjb25zaXN0ZW50IGFuZCB1bmlmaWVkLCBib3RoIHJlc2VydmF0aW9uIG9mIGh1Z2V0
bGIKPiBtZW1vcnkgZnJvbSBib290bWVtIGFuZCBjcmVhdGlvbiBvZiBDTUEgYXJlYXMgZm9yIGh1
Z2V0bGIgbXVzdCBiZSBjYWxsZWQKPiBmcm9tIGNvcmUgTU0gaW5pdGlhbGl6YXRpb24gYW5kIGl0
IHdvdWxkIGhhdmUgYmVlbiBhIHNpbXBsZSBjaGFuZ2UuCj4gSG93ZXZlciwgSFZPLXN0eWxlIHBy
ZS1pbml0aWFsaXphdGlvbiBvcmRlcmluZyByZXF1aXJlbWVudHMgc2xpZ2h0bHkKPiBjb21wbGlj
YXRlIHRoaW5ncyBhbmQgZm9yIEhWTyBwcmUtaW5pdCB0byB3b3JrIHNwYXJzZSBhbmQgbWVtb3J5
IG1hcCBzaG91bGQKPiBiZSBpbml0aWFsaXplZCBhZnRlciBodWdldGxiIHJlc2VydmF0aW9ucy4K
Pgo+IFRoaXMgcmVxdWlyZWQgcHVsbGluZyBvdXQgdGhlIGNhbGwgdG8gZnJlZV9hcmVhX2luaXQo
KSBvdXQgb2Ygc2V0dXBfYXJjaCgpCj4gcGF0aCBhbmQgbW92aW5nIGl0IE1NIGluaXRpYWxpemF0
aW9uIGFuZCB0aGlzIGlzIHdoYXQgdGhlIGZpcnN0IDIzIHBhdGNoZXMKPiBkby4KPgo+IFRoZXNl
IGNoYW5nZXMgYXJlIGRlbGliZXJhdGVseSBzcGxpdCBpbnRvIHBlci1hcmNoIHBhdGNoZXMgdGhh
dCBjaGFuZ2UgaG93Cj4gdGhlIHpvbmUgbGltaXRzIGFyZSBjYWxjdWxhdGVkIGZvciBlYWNoIGFy
Y2hpdGVjdHVyZSBhbmQgdGhlIHBhdGNoZXMgMjIgYW5kCj4gMjMganVzdCByZW1vdmUgdGhlIGNh
bGxzIHRvIGZyZWVfYXJlYV9pbml0KCkgYW5kIHNwcmFzZV9pbml0KCkgZnJvbSBhcmNoLyouCj4K
PiBQYXRjaCAyNCBpcyBhIHNpbXBsZSBjbGVhbnVwIGZvciBNSVBTLgo+Cj4gUGF0Y2hlcyAyNSBh
bmQgMjYgYWN0dWFsbHkgY29uc29saWRhdGUgaHVnZXRsYiByZXNlcnZhdGlvbnMgYW5kIHBhdGNo
ZXMgMjcKPiBhbmQgMjggcGVyZm9ybSBzb21lIGFmdGVybWF0aCBjbGVhbnVwcy4KPgo+IEkgdHJp
ZWQgdG8gdHJpbSB0aGUgZGlzdHJpYnV0aW9uIGxpc3QgYW5kIGFsdGhvdWdoIGl0J3Mgc3RpbGwg
cXVpdGUgbG9uZwo+IGlmIHlvdSBmZWVsIHRoYXQgc29tZW9uZSB3YXMgd3JvbmdseSBleGNsdWRl
ZCBwbGVhc2UgYWRkIHRoZW0gYmFjay4KPgo+IFRoZSBjaGFuZ2VzIGFsc28gYXZhaWxhYmxlIGlu
IGdpdDoKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9y
cHB0L2xpbnV4LmdpdC9sb2cvP2g9aHVnZXRsYi1pbml0L3YyCj4KPiB2MiBjaGFuZ2VzOgo+ICog
bW92ZSB0aGUgaHVnZXRsYiBhbmQgbWVtb3J5IG1hcCBpbml0aWFsaXphaW9uIHRvIG1tX2NvcmVf
aW5pdF9lYXJseSgpCj4gKiBhZGQgQWNrcwo+Cj4gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDI1MTIyODEyNDAwMS4zNjI0NzQyLTEtcnBwdEBrZXJuZWwub3JnCj4KPiBNaWtlIFJh
cG9wb3J0IChNaWNyb3NvZnQpICgyOCk6Cj4gICBhbHBoYTogaW50cm9kdWNlIGFyY2hfem9uZV9s
aW1pdHNfaW5pdCgpCj4gICBhcmM6IGludHJvZHVjZSBhcmNoX3pvbmVfbGltaXRzX2luaXQoKQo+
ICAgYXJtOiBpbnRyb2R1Y2UgYXJjaF96b25lX2xpbWl0c19pbml0KCkKPiAgIGFybTY0OiBpbnRy
b2R1Y2UgYXJjaF96b25lX2xpbWl0c19pbml0KCkKPiAgIGNza3k6IGludHJvZHVjZSBhcmNoX3pv
bmVfbGltaXRzX2luaXQoKQo+ICAgaGV4YWdvbjogaW50cm9kdWNlIGFyY2hfem9uZV9saW1pdHNf
aW5pdCgpCj4gICBsb29uZ2FyY2g6IGludHJvZHVjZSBhcmNoX3pvbmVfbGltaXRzX2luaXQoKQo+
ICAgbTY4azogaW50cm9kdWNlIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gICBtaWNyb2JsYXpl
OiBpbnRyb2R1Y2UgYXJjaF96b25lX2xpbWl0c19pbml0KCkKPiAgIG1pcHM6IGludHJvZHVjZSBh
cmNoX3pvbmVfbGltaXRzX2luaXQoKQo+ICAgbmlvczI6IGludHJvZHVjZSBhcmNoX3pvbmVfbGlt
aXRzX2luaXQoKQo+ICAgb3BlbnJpc2M6IGludHJvZHVjZSBhcmNoX3pvbmVfbGltaXRzX2luaXQo
KQo+ICAgcGFyaXNjOiBpbnRyb2R1Y2UgYXJjaF96b25lX2xpbWl0c19pbml0KCkKPiAgIHBvd2Vy
cGM6IGludHJvZHVjZSBhcmNoX3pvbmVfbGltaXRzX2luaXQoKQo+ICAgcmlzY3Y6IGludHJvZHVj
ZSBhcmNoX3pvbmVfbGltaXRzX2luaXQoKQo+ICAgczM5MDogaW50cm9kdWNlIGFyY2hfem9uZV9s
aW1pdHNfaW5pdCgpCj4gICBzaDogaW50cm9kdWNlIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4g
ICBzcGFyYzogaW50cm9kdWNlIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gICB1bTogaW50cm9k
dWNlIGFyY2hfem9uZV9saW1pdHNfaW5pdCgpCj4gICB4ODY6IGludHJvZHVjZSBhcmNoX3pvbmVf
bGltaXRzX2luaXQoKQo+ICAgeHRlbnNhOiBpbnRyb2R1Y2UgYXJjaF96b25lX2xpbWl0c19pbml0
KCkKPiAgIGFyY2gsIG1tOiBjb25zb2xpZGF0ZSBpbml0aWFsaXphdGlvbiBvZiBub2Rlcywgem9u
ZXMgYW5kIG1lbW9yeSBtYXAKPiAgIGFyY2gsIG1tOiBjb25zb2xpZGF0ZSBpbml0aWFsaXphdGlv
biBvZiBTUEFSU0UgbWVtb3J5IG1vZGVsCj4gICBtaXBzOiBkcm9wIHBhZ2luZ19pbml0KCkKPiAg
IHg4NjogZG9uJ3QgcmVzZXJ2ZSBodWdldGxiIG1lbW9yeSBpbiBzZXR1cF9hcmNoKCkKPiAgIG1t
LCBhcmNoOiBjb25zb2xpZGF0ZSBodWdldGxiIENNQSByZXNlcnZhdGlvbgo+ICAgbW0vaHVnZXRs
YjogZHJvcCBodWdldGxiX2NtYV9jaGVjaygpCj4gICBSZXZlcnQgIm1tL2h1Z2V0bGI6IGRlYWwg
d2l0aCBtdWx0aXBsZSBjYWxscyB0byBodWdldGxiX2Jvb3RtZW1fYWxsb2MiCj4KPiAgLi4uL2Ry
aXZlci1hcGkvY3hsL2xpbnV4L2Vhcmx5LWJvb3QucnN0ICAgICAgIHwgIDIgKy0KPiAgRG9jdW1l
bnRhdGlvbi9tbS9tZW1vcnktbW9kZWwucnN0ICAgICAgICAgICAgIHwgIDMgLS0KPiAgLi4uL3Ry
YW5zbGF0aW9ucy96aF9DTi9tbS9tZW1vcnktbW9kZWwucnN0ICAgIHwgIDIgLQo+ICBhcmNoL2Fs
cGhhL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCj4gIGFyY2gvYWxw
aGEvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKystLS0tCj4gIGFy
Y2gvYXJjL21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKysr
Ky0tLS0tLS0tLQo+ICBhcmNoL2FybS9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyNSArKy0tLS0tLS0tLS0KPiAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9odWdldGxiLmgg
ICAgICAgICAgICAgIHwgIDIgLQo+ICBhcmNoL2FybTY0L21tL2h1Z2V0bGJwYWdlLmMgICAgICAg
ICAgICAgICAgICAgfCAxMCArKy0tLQo+ICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAzOSArKysrKysrKy0tLS0tLS0tLS0tCj4gIGFyY2gvY3NreS9rZXJu
ZWwvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKystLS0tCj4gIGFyY2gvaGV4
YWdvbi9tbS9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKy0tLS0tLQo+ICBh
cmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgfCAgMiAtCj4gIGFy
Y2gvbG9vbmdhcmNoL2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgICAgICB8IDEwIC0tLS0tCj4g
IGFyY2gvbG9vbmdhcmNoL21tL2luaXQuYyAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstLQo+
ICBhcmNoL202OGsvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgOCArKy0t
Cj4gIGFyY2gvbTY4ay9tbS9tY2ZtbXUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzIC0t
Cj4gIGFyY2gvbTY4ay9tbS9tb3Rvcm9sYS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICst
LQo+ICBhcmNoL202OGsvbW0vc3VuM21tdS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgOSAt
LS0tLQo+ICBhcmNoL21pY3JvYmxhemUvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgfCAy
MiArKysrKy0tLS0tLQo+ICBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGdhbGxvYy5oICAgICAgICAg
ICAgICAgfCAgMiAtCj4gIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAg
ICAgICB8ICAyICstCj4gIGFyY2gvbWlwcy9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICAg
ICAgICB8IDE1ICstLS0tLS0KPiAgYXJjaC9taXBzL2xvb25nc29uNjQvbnVtYS5jICAgICAgICAg
ICAgICAgICAgIHwgMTAgKystLS0KPiAgYXJjaC9taXBzL21tL2luaXQuYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDggKy0tLQo+ICBhcmNoL21pcHMvc2dpLWlwMjcvaXAyNy1tZW1vcnku
YyAgICAgICAgICAgICAgfCAgOCArLS0tCj4gIGFyY2gvbmlvczIvbW0vaW5pdC5jICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDEyICsrKy0tLQo+ICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMCArLS0tLQo+ICBhcmNoL3BhcmlzYy9tbS9pbml0LmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMSArLS0tLS0KPiAgYXJjaC9wb3dlcnBjL2luY2x1
ZGUvYXNtL2h1Z2V0bGIuaCAgICAgICAgICAgIHwgIDUgLS0tCj4gIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9zZXR1cC5oICAgICAgICAgICAgICB8ICA0ICsrCj4gIGFyY2gvcG93ZXJwYy9rZXJu
ZWwvc2V0dXAtY29tbW9uLmMgICAgICAgICAgICB8ICAxIC0KPiAgYXJjaC9wb3dlcnBjL21tL2h1
Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgIHwgMTEgKystLS0tCj4gIGFyY2gvcG93ZXJwYy9t
bS9tZW0uYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrKysrLS0tLS0tLS0KPiAgYXJj
aC9wb3dlcnBjL21tL251bWEuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLQo+ICBhcmNo
L3Jpc2N2L21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgICAgfCAgOCArKysrCj4gIGFy
Y2gvcmlzY3YvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEwICstLS0tCj4g
IGFyY2gvczM5MC9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgICAgICAgICAgICB8ICAyIC0KPiAg
YXJjaC9zMzkwL21tL2h1Z2V0bGJwYWdlLmMgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKwo+
ICBhcmNoL3MzOTAvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKyst
LS0tCj4gIGFyY2gvc2gvbW0vaW5pdC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEy
ICsrKy0tLQo+ICBhcmNoL3NwYXJjL21tL2luaXRfNjQuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAxNyArKystLS0tLQo+ICBhcmNoL3NwYXJjL21tL3NybW11LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAxNyArKysrLS0tLQo+ICBhcmNoL3VtL2tlcm5lbC9tZW0uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAxMCArKy0tLQo+ICBhcmNoL3g4Ni9rZXJuZWwvc2V0dXAuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNSAtLS0KPiAgYXJjaC94ODYvbW0vaHVnZXRsYnBhZ2UuYyAgICAg
ICAgICAgICAgICAgICAgIHwgIDggKysrKwo+ICBhcmNoL3g4Ni9tbS9pbml0LmMgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgOCArLS0tCj4gIGFyY2gveDg2L21tL2luaXRfMzIuYyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyIC0KPiAgYXJjaC94ODYvbW0vaW5pdF82NC5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDQgLS0KPiAgYXJjaC94ODYvbW0vbW1faW50ZXJuYWwuaCAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgLQo+ICBhcmNoL3h0ZW5zYS9tbS9pbml0LmMgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAxNCArKystLS0tCj4gIGluY2x1ZGUvbGludXgvaHVnZXRsYi5o
ICAgICAgICAgICAgICAgICAgICAgICB8IDEyICsrLS0tLQo+ICBpbmNsdWRlL2xpbnV4L21tLmgg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0KPiAgaW5jbHVkZS9saW51eC9tbXpv
bmUuaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLQo+ICBpbml0L21haW4uYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIG1tL2h1Z2V0bGIuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzIC0tLS0tLS0KPiAgbW0vaHVnZXRsYl9jbWEu
YyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMzMgKysrKysrKystLS0tLS0tLQo+ICBt
bS9odWdldGxiX2NtYS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSAtLS0KPiAg
bW0vaHVnZXRsYl92bWVtbWFwLmMgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTEgLS0tLS0t
Cj4gIG1tL2ludGVybmFsLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsr
Kwo+ICBtbS9tbV9pbml0LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMCAr
KysrKystLS0tCj4gIDYxIGZpbGVzIGNoYW5nZWQsIDIxOSBpbnNlcnRpb25zKCspLCAzOTQgZGVs
ZXRpb25zKC0pCj4KPgo+IGJhc2UtY29tbWl0OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhk
MGQwNDAyN2NiMWU4Cj4gLS0KPiAyLjUxLjAKPgoKVGhhbmtzIGZvciB0aGlzIHNlcmllcy4gV2hl
biBJIGludHJvZHVjZWQgSFZPIHByZS1pbml0LCBJIG5vdGljZWQgdGhlCmluY29uc2lzdGVuY2ll
cyBpbiBpbml0IG9yZGVyLCBidXQgc2hpZWQgYXdheSBmcm9tIGF0dGVtcHRpbmcgYW55CmdlbmVy
YWwgY2xlYW51cCwgYXMgSSBoYWQgb25seSB0ZXN0ZWQgcHJlLWluaXQgb24geDg2LgoKV2l0aCB0
aGlzLCBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gZW5hYmxlCkFSQ0hfV0FOVF9IVUdFVExCX1ZN
RU1NQVBfUFJFSU5JVCBvbiBhcmNoaXRlY3R1cmVzIHRoYXQgc3VwcG9ydCBIVk8uIEkKdGhpbmsg
dGhhdCdzIG9ubHkgcmlzY3YgYW5kIGxvb25nYXJjaCByaWdodCBub3cuIEJ1dCB0aGF0J3Mgb3V0
IG9mCnNjb3BlIGhlcmUsIHRob3VnaC4KCi0gRnJhbmsKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
