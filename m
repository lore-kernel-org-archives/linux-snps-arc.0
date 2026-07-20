Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137CCC4452B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Jul 2026 22:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N39u17IUSPrEQD6szO0pVN71PvqggAVqhFLRBEDNro=; b=q9lLIB9UhnO2Ip
	IXZTfuq24Lz0DdLxfk0oK4VZmTJ3O/58SGGym3Fni/uLSbk8wyoaSTon5r3bMxzTOivOVwOtY3iXV
	AbFxVrv2zHULSUcJ4S3yBI5WDvpPBhC9oDiE4NDSW4l7n0089M0gsXwwSRBHcWxAlr/oM0vVPIPid
	EL+ZWNht3l2eNuei4vZkiT/emgWTw05JlbXcFz/7OfGhuXf0W/fPf4lu2j+8LKZOPrH+Dag7E8f3/
	6SixlkZl/5nrO5w6FxVQ19U4I8R3g3uujlxCfTSLCN9EmASTX+pmlQgPzVOvX+xFILoR9ZDHBq8iq
	fT6RkR3vTHWszQttM+UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw37-00000007zes-2dhb;
	Mon, 20 Jul 2026 22:01:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlw34-00000007zdX-3Syz
	for linux-snps-arc@lists.infradead.org;
	Mon, 20 Jul 2026 22:01:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so12016609a12.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 20 Jul 2026 15:01:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784584875; cv=none;
        d=google.com; s=arc-20260327;
        b=HgSe5ZsoTYtPtioeskKrHMA3R0sVY8UlBazbKa2c8ASlJMq0NnHtHqtUYnYzt06tQW
         xptGXOeVpMYOqn4lG1LwTj5NVZivTrJIeiwIsf1SJnJKIusLvFMShUBfLvMUn2QL1IWA
         b0KAB1zItKr3W3q7PNrTnVBDH9SDdngC9sTerl9qfoTWpAYWOzaBlyfObHeZEM4sh//L
         TUObtYT/6ajFt5tx6lKmd0yTkTu+YQB/iEqDIy+jJpmJWPcpqQ1ALVbg2UUyTQi6+m6e
         GJw5bRMIQv1aQRdWZD+r64LDh+hR5BLu9rWbjCekFaRofLaDuuZ69E09+OPMMBB+VQZC
         f+fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        fh=VtK0aHoDs/QcLYZlG0nKNJcZYt1ZY1mOBCaAmhoKm8c=;
        b=PISifZMY/n/0K+pYf4Knj+p1X7QT79zBFY1AALU0p8ewmZvIktddPzUjciUyTi5myL
         qAF6yshr7smyNR4Rd8ybFcypOcIf1/s6CmzpFhU/PHN/Mc/YEJsUKT2rY0IuhIUDOYiK
         7MOKQuM6ccFwJZO4UXLyQefrPGm20CF2HbzhKHbfkRxQm3AraaQ5VJnmXDtQo7+UwmJg
         kuvs3G3vSVZsIJt1lx/r/8Kyva3cMRcaZJvjtFcqmiLl8oKgQ1qZiwwyXOJEl+onrYXA
         nTiMyv0GtO70CJKlgm5kl0uQDCS4rqaARSjUN5/GJH8m1LK3XMreTixiLX+g9gyffgxy
         GFEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784584875; x=1785189675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=ATpqX8nFGkX06O96CHYqFHGEGRBgYNqOEPwq4kPkLTSA/Kydea1A9Sc86hGItNaha6
         4HIk3H628+93eLJ5+YBXaYoiAAiUUHCHF8luTOlUsnBAlwjppLn6QyHdKojpdENE5lZE
         51of4GqAr4KD1C3NHHAxAGQo6xJygmj7nHRv05PAZz+DxH8rsa4qbKEI2uubPT7176NW
         SbRDNm8g8BXN1ghIKeboyPKFQ6+lD6OVyej5AnWx+o+txvXNXIEW7IEKniuqHLN76uiw
         AuOGwvRVpBpYJUTgKj20JdcLcFG7wA8dm2yxsAJ5HpRBlUSYkf7qhiija3Ztu3vElrJJ
         cPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584875; x=1785189675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFKHaLiuiIMT2s5Bf3SZwWbn7++lylaBZHxfNpeM7Fk=;
        b=X32gMOEpzh1jWFqgiranV4ijLEcCd1lD6jleiNhNrm0Df7VXhIcPXTRUX9oFKdsGl9
         vcb+jcfA0ZhWlJ83CKStm7741N7yL9K1WFk6hLU7AHq+HvLC2Q/LQC0aqpvGluFbj8eF
         ztjePgY84I33zbi7AkWDFVb35xBR9Dfe+8/Nkm9yBhWA7GRLMbr9HYnsMU107FA74YkB
         Lp8LzCddblUxKR2oWCce8WD1oAbv+vkzKpKlV6mZh+MWU8kr5pf7QO0Lk9dx1BUAN8CQ
         k1KYt5RTl+FXxKm/FZhVz9LWxbcmydrtLNzh4ez+mqDMZqr0Fq31pHB3rGZtTnjBrE6a
         ReJw==
X-Forwarded-Encrypted: i=1; AHgh+Rrp8Bp15Kh04IgwUSYPVEpB6uRiPEZ2KDEFzb0f875wIdo/eQAHBjtdfZxO/WXd5216UjxhiXcb7jKttv8jFA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTywiaC6eiV0zqAAUSYD/toRQ7jZwdHN/WCEXQ8uC3aWGC9tY
	HdqdvTc2F/fomzSAzsdCGz6ekjAAvndUHNWVo305j2H/T57zpPyzP0/SE10UgzkyNa7Zsb3NogP
	9Gta0xC375Ids074JZLCqAeNCaiZb1Jk=
X-Gm-Gg: AR+sD10IPy7zYnJURFDE2Nj/3d9QdhvRHxgDzw9+wnI4HO3XrmRYOZ/D0MoM1rFMm8L
	y4++CXCjvpkOWDvBF0mLYeh1FYWXeQqc0QTFODA2UZi7tCTEL3w8jX423QCIKABDnKNYvjeJkNf
	08HA+lUClzAIHOZWFfDbPxlp80kbGEyM/1b0g/cowrTv2hPQ6khYxHc7deMm6Wqhn9OK5h3XlXJ
	zIJ83Qgx4DYakgudKUZ0/qHDimtkTQm/EpFQ+un+TYhORCrVlSdn/sHP/ItuN6kVWK8n2xwDWCJ
	luCtp4hWtybasjYP1ZAlpHUuMjeu65U=
X-Received: by 2002:a05:6402:2356:b0:674:5b2c:d42c with SMTP id
 4fb4d7f45d1cf-69e6525c770mr6536246a12.3.1784584875096; Mon, 20 Jul 2026
 15:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
 <87wluplb6k.ffs@fw13>
In-Reply-To: <87wluplb6k.ffs@fw13>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 21 Jul 2026 00:01:03 +0200
X-Gm-Features: AUfX_mw5696pn_wiz_LjCaJHiFU9IchwhNNUbBWmuIdhtqSFIK3TJnj9-atYCBw
Message-ID: <CA+=Fv5Sd5+-K3-MOiEc2N8z_5CoLQPVPUwjiugSj3u8cBWJXXQ@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_150118_894527_0646099B 
X-CRM114-Status: GOOD (  20.49  )
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

VGhvbWFzLAoKT24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgOToyMeKAr1BNIFRob21hcyBHbGVpeG5l
ciA8dGdseEBrZXJuZWwub3JnPiB3cm90ZToKPgo+Cj4gU2ltaWxhciB0byB3aGF0IFBldGVyIGFu
ZCBtZSBzdWdnZXN0ZWQgaW4gdGhlIHJlbGF0ZWQgZGlzY3Vzc2lvbgo+IHZzLiBzMzkwIHdoaWNo
IGhhcyBhIHNpbWlsYXIgaXNzdWUsIHlvdSBjYW4ganVzdCBoYXZlIGEgZGVkaWNhdGVkCj4gc3lz
Y2FsbF9yZXR1cm4gbWVtYmVyIGluIHlvdXIgcHRfcmVncyBzdHJ1Y3QsIHdoaWNoIGlzIHByZXNl
dCB0byAtRU5PU1lTCj4gYW5kIG9wZXJhdGUgb24gdGhhdC4gWW91IGhhdmUgYW4gdW51c2VkIHBh
ZGRpbmcgZW50cnkgdGhlcmUgd2hpY2ggbWVhbnMKPiBpdCB3b24ndCBldmVuIGNoYW5nZSB0aGUg
c2l6ZS4KPgoKVGhhbmtzLCB0aGF0IG1ha2VzIHNlbnNlIGluIHByaW5jaXBsZS4KCk9uZSBjb21w
bGljYXRpb24gaXMgdGhhdCBteSBBbHBoYSBHRU5FUklDX0VOVFJZIGJyYW5jaCBhbHJlYWR5IHJl
dXNlcyB0aGF0CmZvcm1lciBwdF9yZWdzIHBhZGRpbmcgc2xvdCwgd2hpbGUga2VlcGluZyB0aGUg
cHRfcmVncyBzaXplIGFuZCBzdGFjawphbGlnbm1lbnQgdW5jaGFuZ2VkLiBUaGUgZXh0cmEgc3lz
Y2FsbC1lbnRyeSBib29ra2VlcGluZyBJIG5lZWRlZCBzbyBmYXIgbGl2ZXMKaW4gdGhyZWFkX2lu
Zm8gcmF0aGVyIHRoYW4gYWRkaW5nIG1vcmUgZmllbGRzIHRvIHB0X3JlZ3MuCgpTbyB0aGUgcGFk
ZGluZyBzbG90IGlzIG5vdCBmcmVlIGluIG15IGN1cnJlbnQgYnJhbmNoLiBJIGNhbiBzdGlsbCBs
b29rIGF0CndoZXRoZXIgYSBkZWRpY2F0ZWQgc3lzY2FsbF9yZXR1cm4gc2NyYXRjaCB2YWx1ZSB3
b3VsZCBiZSBjbGVhbmVyLCBidXQgdGhlCnRlc3RlZCB2ZXJzaW9uIGN1cnJlbnRseSBoYW5kbGVz
IHRoaXMgYnkgc2V0dGluZyB0aGUgZGVmYXVsdCAtRU5PU1lTIHJlc3VsdApvbmx5IG9uIHRoZSBu
by1kaXNwYXRjaCBwYXRoLCBhZnRlciBnZW5lcmljIGVudHJ5IHByb2Nlc3NpbmcsIGFuZCBvbmx5
IGlmCnB0cmFjZS9zZWNjb21wL0JQRiBkaWQgbm90IGFscmVhZHkgcHJvdmlkZSBhIHJldHVybiB2
YWx1ZS4KCj4KPiBZb3Ugd2VyZSBvbiBDQyBmb3IgdGhlIFYyLCBubz8KPgoKU29ycnksIEkgbXVz
dCBoYXZlIG1pc3NlZCB0aGF0LgoKPiBUaGUgd2hvbGUgcGlsZSBpbmNsdWRpbmcgSmluamllJ3Mg
c2VjY29tcCBieXBhc3MgZml4IGlzIGluCj4KPiAgICAgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0IGNvcmUvZW50cnkKPgo+IGFuZCBpcyB0
YXJnZXRlZCBmb3IgdGhlIDcuMyBtZXJnZSB3aW5kb3cuCj4KCkdyZWF0IQoKPiBJZiB5b3Ugd2Fu
dCB0byBiYXNlIHlvdXIgc3R1ZmYgb24gdGhhdCBmb3IgNy4zLCBJIGNhbiBhZGQgYSB0YWcgd2hp
Y2gKPiBtYWtlcyBpdCBpbW11dGFibGUgc28gaXQgY2FuIGJlIHB1bGxlZCBpbnRvIHRoZSBhbHBo
YSB0cmVlLgo+CgpZZXMsIHBsZWFzZS4gVGhlcmUgaXMgc3RpbGwgc29tZSBvbmdvaW5nIHRlc3Rp
bmcvcmV2aWV3IG9mIG15IEFscGhhCkdFTkVSSUNfRU5UUlkgc2VyaWVzLCBidXQgYXNzdW1pbmcg
aXQgaXMgcmVhZHkgaW4gdGltZSBmb3IgdGhlIDcuMyBtZXJnZQp3aW5kb3csIGFuIGltbXV0YWJs
ZSB0YWcgd291bGQgYmUgdmVyeSBoZWxwZnVsLgoKTWFnbnVzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QK
bGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
