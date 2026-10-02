Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C031CA5FD4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  2 Oct 2026 07:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n70+kDeRAAnszWjfe3pEzDKTci7mqinWT3avyQZ7LSk=; b=yB3W2o1dpnThFx
	KkkvqZiP2yqDn68nEC3MFUNcNR+rF8UyDRgEr2ryI7b/flUMRSTTi7QxiFF5pJWAnm5pg/wVFf4ar
	wvQbafcYvKupUuJQjhiwVIyKXXaSagQ14iO/Pz/vpez5r0CDR+eAFc1lIVnLe3YGrB+YLMf2I3poD
	aAulqVKz0Wj9mQKFRFaM/xm/YNKPc+eeoZ0/jdehXVgVX7pkmjJZNcoPjRtmX4fKY3fGkKeduBlU2
	6BIm/kx5fUDpM0/OWCi4OpmZNTQilw3bb4378LPZIIGi4n/pK2+znXvXJ8eiQ34GNE1MslLqPqx8T
	l7zREFyo0LE7pMK05VRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXeF-0000000AozC-3Fn0;
	Fri, 02 Oct 2026 07:25:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCXeD-0000000Aoyq-1VLy
	for linux-snps-arc@lists.infradead.org;
	Fri, 02 Oct 2026 07:25:38 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6acb9c018ffso1896400a12.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 02 Oct 2026 00:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790925935; cv=none;
        d=google.com; s=arc-20260327;
        b=j6OBXhNW/Y88CP8yMiEsptxZFZpwfCcNLhpdL/4OZA54BwYVai0uKaqnJp5PUdr6fI
         BWWDL0XQFG+gMzf0W/jUawKZMEz6WB14Q0kFR148CvJDdWXzH5HFgvYrZlnWKy7y6cPb
         rU5zdC/Ay3RRHUeF5RRziNldQ7197w+a9pLkEgq9wiHBfeYoO0VQn691LeCU0LBEmGX0
         yNZ+4274hKBS+jId5f0s41lsnAF+hvJvItaVoWAE8aK+1rDxyog4q9Eh5g4adBuFRd5M
         vChZ7wyaP38CmQnjz3BYJbOOv8u897YkDJtXtDH/Yr+nDkXujTZduKDYwQC9sOY5QkQy
         /Axw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        fh=ZXpPFTdx2dd+J68Vu5fIF4onpSFpiQEzg7FPqslAhwg=;
        b=sxuQk3G1xOox0JIM5HezZukp6at3R3vCoWfHm9levwcL/NtXxapDNhvDNKvBTHon1l
         vrKiXM51dqkGCfqRbwhrASVxs/ae7oKwQ/qKYciiqXais2Y8KqLtC7SP8vvJxK13QOcl
         nQaq1P6ok9+NB6vW0iQE4dDiuGDgL/Eha1Yfu866C7tzAsZ2zWkK4VwvZcSHoenwQOq5
         A3QcFlQEQtukN1MY+QObV2XvXq7YbtahgGwYnSOY4eAaR04SV4RAciUdRQT/fUEMnHt+
         dTHmSt5cyzx49FYrhT8+gc/pfwy76m+GCOz2kGfYPiq9FhmTF9+HFKP6GEH6OvtdwdT1
         UkGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925935; x=1791530735; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        b=Xbqu+G842Bk3SEkmmVm1wu6U1WJSv0JSZR/InoTRJFaWaGCvVdSBqBplkxWPGvwDLM
         aqTuBg6NE5sbwVkqLgc1Msm1W6Qi1aC7maeV9EAvrBb1ltIo1gDYyAp4UYgzJS8uh5vL
         D9Sk6zhgc4FHmReiIhPZVNcci0Y+xB3xFyi4ZwuqC2BXTFGtAi42OXrCTBmgqPosivKt
         oanE28A1xN0Ef+FnVZhtQxvJ7oYL8St+Q29g2IUoBTb6DjtZqz7lftyeEvbqxQKDPAc8
         RB5M6vO5KcqY7wNa/QH9TIolXEmwPTuewVsSiJ/JPDgFQjKh2Gh8698RQdqo3vIt57gy
         DUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925935; x=1791530735;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x59KLtPfuG4aN7iW1gUsYPP/JvC2giQpEEdn897TLao=;
        b=XiJ2RmZ0rcB4+EqTSVKptqAbMVt06/qLkO8adaI1s/l6B/XbwW782N/KZGENuS5gxq
         XD/QXr9sZBxdDG71mkT/mhAvLFsI2BjvSaWedoQsG/p9rhlfOxWE5WQD8JpruF+Pdcoz
         tCnN9eTgV++R1bcK9FxPN3/FJqvmTjbB9repZcSNsk3iLQFYSYmGHB9AuiESSPqGavi1
         +sodvZe8/MVueW7/ZOhR0o6/wcjiQbPlIrjtndZ4Bd0uFQCrSRj039A1AMcHeVAPKExC
         l6QTusKV2GjL09CESKWyUo3u9CPlkghvYBpZB1ow+SM65El+bdYRM+gdEvkMzQ9IqBFD
         p1ZA==
X-Forwarded-Encrypted: i=1; AKwUvByGRyVwNHM90GdO04VtF/bjh0Lp82Mpk0OLiZEHlo0ns0yFVmVSnion0O+yUvQTkqdzoYIrGpuWYmrDWaJJ7w==@lists.infradead.org
X-Gm-Message-State: AFq9FYL7PIOsVojQKCdSCLOiHQPRt/EQ5OEoFs1bEQBh6piiZKZCt4gm
	a5Egi7FELmdfTBeAWTd+iDvHSJYsgmdN8F9XEFMWrSBoFEJ69hd5VnehSA7uov7/RoOIFWd4LM/
	E/kt+71AM78XKti2p/XpFOfywP1yIU3w=
X-Gm-Gg: AYBFou2aKOoYLCrpTFQKUFx2IdVbEJLiIMgLmBxmwNO+zU/njvwPTIE0mXlJ0a9hUd8
	1snWWjaD1sk36F02U4DyiQ1aK6hFGOlFwSG9th2MSJ++fzNRD9wKZYFIfehG7hEtzsrUBB+ODzz
	pD9aZaQ+dNxkfWu5u1xocpxda1LcgJEbckrwm0I8t0c5Em5YxUH2zeSeTbxwa+6ZrVrY4SyYSW2
	r9vvmUu2LoEV0xln5Pv2WKSGn6H/QjGQMCF61dF70Jiu4u18Vn35NlFpPT9lh//qMSHUT0GAy6N
	O+G5q63++cJgbMkMwL1mTAV6CTyq9vJSDLNVUMh7RvLDKw2TYALcrihdsSwzl89uQxDfGX8Odff
	nFDcJkHtluolFryb3jitsd/7YuAsjKi+waHb9jGQjIksLCCHoRUNTpoP6E04B48tWgdYYmT5v5y
	AuB3KR+VuHhr4obnJtkjAtmwiLrgToQx8HvxFGP0ii02fA6BgCqMeygs+rdUndEuZQDQ==
X-Received: by 2002:a05:6402:5165:b0:6a9:8863:ada4 with SMTP id
 4fb4d7f45d1cf-6ae307e5667mr2995775a12.3.1790925935285; Fri, 02 Oct 2026
 00:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260925183050.56839-1-rosenp@gmail.com> <2026100129-unrest-cleaver-6528@gregkh>
 <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com> <2026100211-unturned-scam-fd80@gregkh>
In-Reply-To: <2026100211-unturned-scam-fd80@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 2 Oct 2026 00:25:23 -0700
X-Gm-Features: AclHuK-DIP7WjK3JYUzQGXnqA3_qOSSMeSBRglKWf3j7RwahMAS-EdxikdQir5E
Message-ID: <CAKxU2N_Nm3rRnXEg9+-iwRSHXrvV-0rgdDQdmhn2MojTneFU7g@mail.gmail.com>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_002537_424291_55EB3CE4 
X-CRM114-Status: GOOD (  21.28  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxMDo1NeKAr1BNIEdyZWcgS3JvYWgtSGFydG1hbgo8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMDEsIDIwMjYg
YXQgMTE6NTg6MDVBTSAtMDcwMCwgUm9zZW4gUGVuZXYgd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCAx
LCAyMDI2IGF0IDE6NDLigK9BTSBHcmVnIEtyb2FoLUhhcnRtYW4KPiA+IDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgU2VwIDI1LCAyMDI2IGF0
IDExOjMwOjUwQU0gLTA3MDAsIFJvc2VuIFBlbmV2IHdyb3RlOgo+ID4gPiA+IEF2b2lkIGNhbGxp
bmcgaXJxX2Rpc3Bvc2VfbWFwcGluZygpIGJ5IGxldHRpbmcgdGhlIHBsYXRmb3JtX2RldmljZQo+
ID4gPiA+IG1hY2hpbmVyeSBoYW5kbGUgaXQuIEFsc28gZW5hYmxlIHBvc3NpYmlsaXR5IG9mIGhh
bmRsaW5nIC1FUFJPQkVfREVGRVIKPiA+ID4gPiBhbmQgb3RoZXIgZXJyb3JzLiBIYW5kbGUgYXMg
ZWFybHkgYXMgcG9zc2libGUgdG8gYXZvaWQgZG9pbmcgdW5uZWNlc3NhcnkKPiA+ID4gPiB3b3Jr
Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFp
bC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvdHR5L3NlcmlhbC9hcmNfdWFydC5j
IHwgOCArKysrKystLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3Nl
cmlhbC9hcmNfdWFydC5jIGIvZHJpdmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMKPiA+ID4gPiBp
bmRleCAzOTg4ZTU5NTg4OTYuLmI0NmIwNTdhMTgxYiAxMDA2NDQKPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYwo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvdHR5L3Nlcmlh
bC9hcmNfdWFydC5jCj4gPiA+ID4gQEAgLTMwLDcgKzMwLDYgQEAKPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3R0eV9mbGlwLmg+Cj4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9zZXJpYWxfY29yZS5o
Pgo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvaW8uaD4KPiA+ID4gPiAtI2luY2x1ZGUgPGxpbnV4
L29mX2lycS5oPgo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvb2ZfYWRkcmVzcy5oPgo+ID4gPiA+
Cj4gPiA+ID4gIC8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gPiA+ID4g
QEAgLTU3MSwxMiArNTcwLDE3IEBAIHN0YXRpYyBpbnQgYXJjX3NlcmlhbF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gPiA+ICAgICAgIHN0cnVjdCBhcmNfdWFydF9wb3J0
ICp1YXJ0Owo+ID4gPiA+ICAgICAgIHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQ7Cj4gPiA+ID4gICAg
ICAgaW50IGRldl9pZDsKPiA+ID4gPiArICAgICBpbnQgaXJxOwo+ID4gPiA+ICAgICAgIHUzMiB2
YWw7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAvKiBubyBkZXZpY2UgdHJlZSBkZXZpY2UgKi8KPiA+
ID4gPiAgICAgICBpZiAoIW5wKQo+ID4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7
Cj4gPiA+ID4KPiA+ID4gPiArICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+
ID4gPiA+ICsgICAgIGlmIChpcnEgPCAwKQo+ID4gPiA+ICsgICAgICAgICAgICAgcmV0dXJuIGly
cTsKPiA+ID4gPiArCj4gPiA+ID4gICAgICAgZGV2X2lkID0gb2ZfYWxpYXNfZ2V0X2lkKG5wLCAi
c2VyaWFsIik7Cj4gPiA+ID4gICAgICAgaWYgKGRldl9pZCA8IDApCj4gPiA+ID4gICAgICAgICAg
ICAgICBkZXZfaWQgPSAwOwo+ID4gPiA+IEBAIC02MDcsNyArNjExLDcgQEAgc3RhdGljIGludCBh
cmNfc2VyaWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiA+ID4gICAg
ICAgICAgICAgICByZXR1cm4gUFRSX0VSUihwb3J0LT5tZW1iYXNlKTsKPiA+ID4gPiAgICAgICB9
Cj4gPiA+ID4KPiA+ID4gPiAtICAgICBwb3J0LT5pcnEgPSBpcnFfb2ZfcGFyc2VfYW5kX21hcChu
cCwgMCk7Cj4gPiA+ID4gKyAgICAgcG9ydC0+aXJxID0gaXJxOwo+ID4gPiA+Cj4gPiA+ID4gICAg
ICAgcG9ydC0+ZGV2ID0gJnBkZXYtPmRldjsKPiA+ID4gPiAgICAgICBwb3J0LT5pb3R5cGUgPSBV
UElPX01FTTsKPiA+ID4gPiAtLQo+ID4gPiA+IDIuNTUuMAo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4K
PiA+ID4gWW91IGZvcmdvdCBhbiBBc3Npc3RlZC1ieTogdGFnIGhlcmUgOigKPiA+IE5vIExMTSB1
c2VkIGhlcmUuCj4KPiBUaGVuIHdoYXQgdG9vbCB3YXMgdXNlZCB0byBmaW5kIHRoaXMgaXNzdWU/
CmdpdCBncmVwIGlycV9vZl9wYXJzZV9hbmRfbWFwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
