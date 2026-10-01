Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3E4CA5FCE
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Oct 2026 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+mbSKnsd69d1AJ6kZ+Mhja7dqCo+oC0XJBqKYziSrM=; b=11eKJONTnkGPur
	QB9Ymidhd66rOmiIdl6sfD1kDxAe8BWsKKgTVWANLASuSAAGT4v15lTLYkRZRS3YSIcjwLIUDA2Ow
	pIq1tiJw7eJlZTJysEpF//mVZxBAFQ6Ly5EhiYbdE+GOKtcT2ELnnlzyCqpEJMqj6o+Bix5FJWQM2
	kwXjV7RqELocT0yLu4agZTqOJDFaXmbnbdAxAO4xWKoIdnPk/KkUn90Zvf37nV42jg0QCRrBSj0nR
	gt6024+TT4B9U2MrEr0AP1vYlzywgcznUrI1m5Wjhzl/EPHjydySl9pdm3HuMJaBW+5kXSPEPVivG
	j0nFripXin48uIVp1tdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLz6-0000000A2uI-0Jgq;
	Thu, 01 Oct 2026 18:58:24 +0000
Received: from mail-ed2-x2b.google.com ([2a00:1450:4864:33::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCLz3-0000000A2tt-1kc1
	for linux-snps-arc@lists.infradead.org;
	Thu, 01 Oct 2026 18:58:23 +0000
Received: by mail-ed2-x2b.google.com with SMTP id 4fb4d7f45d1cf-6ae19319854so3324077a12.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 01 Oct 2026 11:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790881097; cv=none;
        d=google.com; s=arc-20260327;
        b=dHqDgczz4OK/fX+tqpD3PA7M6gfOnJt3QpjtKOigMFx8n9JAFDRY4/tMsj7PHVlc5U
         tSt4WePVgGyyEyApmn6iMeRg/nypgsUUKoMMj230VZo4CUkJSl4L2TnCT9XieqK9GVAI
         MDhPuUxQfcJcJ4QVhuA5XoDQJNOPybkL98iDzLOZIV7E31aifurm55ZYgXo7aUnCCVSh
         WWHvYcBtFKKewApYG7aoIb+rFoZPWBQ/2MkgFQItKtAghOhlNj3ml+5XyIGfFPs9Ybjm
         MeDj9kkIKgcgpteeoGBoLwsOLth2yU7durLp2esCnFr0m9lbqjTl+swzfnEvmLakjl6C
         BhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        fh=r3RUH7xo19qK/SlniGOXILOvKmTyOTDMM/moFDEnUD8=;
        b=g7y2vBUxh1TPqesmFSoHgogZbvv2oz24VoK/7XUYCrKWvX1da2yPCtggI3tbH4osg/
         vSDoAKplXMS87hUimvY/yd61t2z2882fsLp9yrKS/w/SZzKXQn6l/d5xxY2SpvW3hmxZ
         +73QSctvMDmg8+bOb4YBptXi6VSiNitMUObKYpCM/wae0U1ZIrpZeHSqPcWIS/yDzSG+
         7tk4FxrvRUM1RCZfmCSjc9gy2VOqk2Sa2mWKb8kLWyPS5vo7VXIDSTwevNnl1aU0aYlv
         ih/lnrj5qvPfBT9ImA2qG+crgdLaFWdudemMREeK/9b9FQvMRVRdS8S8oVFVK9UXAW5z
         DHkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790881097; x=1791485897; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        b=Mhemvjpy8vS2FL/Vo/6i/9xySJVVdRAKZfdWxkiiMlrgmfzZAqf1D7VEgtX2k7P9ep
         3sPp9sUYsTrTTiH9uHnK8A1kYzCjhfu0n1EBmR4/JIXPrTW2/kr4JYyfpPRAA1svn4nJ
         St7bJP0do2De7TzT5lHfBxbd63mrlWJ/zzxxmMA0FUcZPnOyaWE/7IhKyhB+3w07V+xX
         JGWX2mls9e7URvzIYb0wwVFUWCijgIMQ19UjKuLTQ3ezpcwLKlCboLnM3hw3JF10ySUg
         061NkRWjh+YhA0ODdAWyYOPs+7K0I6NXB1a/bpQ2coAH/mK4/1VjaavNXWj6MKjzi8Ss
         +lxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790881097; x=1791485897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+gdBCcya7Jd9eS7uFOMyWkhA5NDxvi9ClIG0tBCXyRE=;
        b=Q6HACoSq6tLjIes9yoYJLEO+eC3v/BTSLf0C+IOVeMggrGxELeDtSZNu17/luvnmz8
         JJSKv8p9aQABBpN80RwTh0Lvhs8khBEdWd2axkef/xV5lmk57Mdt6YwZb4HIV5+cQLNz
         S2cCK0sMvivm3NNc8UshNAWyjHbBXbpDbqQnrFeiT0eXNdF0OPIcGjW8lKTy4aejKjcG
         FlnncS/j79Cq0DNyT0KbPqatOw7e1Rck86QxWsR9hDGkXHrItTE6skWiLgGTDrprfwmx
         ysPwWz62HzO332PATuoKvyiIVtVsg1JgNeTWjxxNHwFDUmA7DDjFNonX2HcObNpzBBBm
         si6g==
X-Forwarded-Encrypted: i=1; AKwUvBx0GhM2MaLPx5GVsx59+IPHb4BQq9bQs4t1V0ZO8Vk2pXih/we5d2dr6a15yTJuSvy+vnU5b1sjMaksbWj2fg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL2XpOcnPlNThnL8KcxMd5Ca257CvOTTVwY5bVAu2bZV48wJ2V4
	qHR+cHKEslTYaOCO7iVwmJ/nYMkvoE2CRL+adE/D6dtFHTzKoSnshR62n3pmKOHY5gg6rkn1DiO
	W3G6HsyfaA+2ve9i7lbhbAdg9M2JDjbKozrVU
X-Gm-Gg: AYBFou3yQWuzt3joJENSeXaj0/h2ti/CZ7wBQFyW7Y3HfU05Cg7RarYDSOVrW2Ii9c7
	fboxO34Kv6/RrMwj64E4LqvCnGHJkm1UWKhuNCyk23duxf2dHtab/Nob3/1ntQWLMGKZx+bGxrW
	mjU4a+VswKpeGk36vjz0+hllkzKip/KXWfVb4Tkcj2zcuZVUvnoLqS+YB+J3jXXSEa9NGstsgQR
	y2Fa7le7sAMnRQBvRdY9oWgevVUGoINrBl/25cH/QlSJQBYCDdMVVHMs/Z9t9DKkeGoaocLXmiM
	zNJA5dwnuwsZia648uf6yAbOtWjK2T9jXTsL2NgrssdXgarFaqlTEPl1g8Pn2ShMFXYzPcQX812
	EkltYUbMgyR2jc8Axm1OvXaGikmm7JX9e6zcXCS/XYTHrjZbfBtgL98CU3aUoG6Fs1DIOkRH3nM
	4Y1luBSYXkQYn8eHXkPcvz2bD0NJY8tCVi8QG2fMoeVrtDMETO8SW4L+0QrICCZkzlBQ==
X-Received: by 2002:a05:6402:320a:b0:6a9:ae86:bb1b with SMTP id
 4fb4d7f45d1cf-6af9e03ded3mr104018a12.5.1790881097207; Thu, 01 Oct 2026
 11:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260925183050.56839-1-rosenp@gmail.com> <2026100129-unrest-cleaver-6528@gregkh>
In-Reply-To: <2026100129-unrest-cleaver-6528@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 1 Oct 2026 11:58:05 -0700
X-Gm-Features: AclHuK96Et8-MkZL9LMhD_ijnC8Z5TWGJ6g5yJxUOPLdgKxS1Jb9-JO48yVLGLI
Message-ID: <CAKxU2N8Z-CSxki5mWQvJCEiQDmy00WLJqPEMgujOA0LQzbHHjw@mail.gmail.com>
Subject: Re: [PATCH] serial: arc_uart: Use platform IRQ helper
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_115821_478145_D4298351 
X-CRM114-Status: GOOD (  19.71  )
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxOjQy4oCvQU0gR3JlZyBLcm9haC1IYXJ0bWFuCjxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyNSwgMjAyNiBh
dCAxMTozMDo1MEFNIC0wNzAwLCBSb3NlbiBQZW5ldiB3cm90ZToKPiA+IEF2b2lkIGNhbGxpbmcg
aXJxX2Rpc3Bvc2VfbWFwcGluZygpIGJ5IGxldHRpbmcgdGhlIHBsYXRmb3JtX2RldmljZQo+ID4g
bWFjaGluZXJ5IGhhbmRsZSBpdC4gQWxzbyBlbmFibGUgcG9zc2liaWxpdHkgb2YgaGFuZGxpbmcg
LUVQUk9CRV9ERUZFUgo+ID4gYW5kIG90aGVyIGVycm9ycy4gSGFuZGxlIGFzIGVhcmx5IGFzIHBv
c3NpYmxlIHRvIGF2b2lkIGRvaW5nIHVubmVjZXNzYXJ5Cj4gPiB3b3JrLgo+ID4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFJvc2VuIFBlbmV2IDxyb3NlbnBAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMgfCA4ICsrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc2VyaWFsL2FyY191YXJ0LmMgYi9kcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3Vh
cnQuYwo+ID4gaW5kZXggMzk4OGU1OTU4ODk2Li5iNDZiMDU3YTE4MWIgMTAwNjQ0Cj4gPiAtLS0g
YS9kcml2ZXJzL3R0eS9zZXJpYWwvYXJjX3VhcnQuYwo+ID4gKysrIGIvZHJpdmVycy90dHkvc2Vy
aWFsL2FyY191YXJ0LmMKPiA+IEBAIC0zMCw3ICszMCw2IEBACj4gPiAgI2luY2x1ZGUgPGxpbnV4
L3R0eV9mbGlwLmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3NlcmlhbF9jb3JlLmg+Cj4gPiAgI2lu
Y2x1ZGUgPGxpbnV4L2lvLmg+Cj4gPiAtI2luY2x1ZGUgPGxpbnV4L29mX2lycS5oPgo+ID4gICNp
bmNsdWRlIDxsaW51eC9vZl9hZGRyZXNzLmg+Cj4gPgo+ID4gIC8qKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqCj4gPiBAQCAtNTcxLDEyICs1NzAsMTcgQEAgc3RhdGljIGludCBh
cmNfc2VyaWFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICBz
dHJ1Y3QgYXJjX3VhcnRfcG9ydCAqdWFydDsKPiA+ICAgICAgIHN0cnVjdCB1YXJ0X3BvcnQgKnBv
cnQ7Cj4gPiAgICAgICBpbnQgZGV2X2lkOwo+ID4gKyAgICAgaW50IGlycTsKPiA+ICAgICAgIHUz
MiB2YWw7Cj4gPgo+ID4gICAgICAgLyogbm8gZGV2aWNlIHRyZWUgZGV2aWNlICovCj4gPiAgICAg
ICBpZiAoIW5wKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiA+Cj4gPiArICAg
ICBpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOwo+ID4gKyAgICAgaWYgKGlycSA8IDAp
Cj4gPiArICAgICAgICAgICAgIHJldHVybiBpcnE7Cj4gPiArCj4gPiAgICAgICBkZXZfaWQgPSBv
Zl9hbGlhc19nZXRfaWQobnAsICJzZXJpYWwiKTsKPiA+ICAgICAgIGlmIChkZXZfaWQgPCAwKQo+
ID4gICAgICAgICAgICAgICBkZXZfaWQgPSAwOwo+ID4gQEAgLTYwNyw3ICs2MTEsNyBAQCBzdGF0
aWMgaW50IGFyY19zZXJpYWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+
ICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocG9ydC0+bWVtYmFzZSk7Cj4gPiAgICAgICB9
Cj4gPgo+ID4gLSAgICAgcG9ydC0+aXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOwo+
ID4gKyAgICAgcG9ydC0+aXJxID0gaXJxOwo+ID4KPiA+ICAgICAgIHBvcnQtPmRldiA9ICZwZGV2
LT5kZXY7Cj4gPiAgICAgICBwb3J0LT5pb3R5cGUgPSBVUElPX01FTTsKPiA+IC0tCj4gPiAyLjU1
LjAKPiA+Cj4gPgo+Cj4gWW91IGZvcmdvdCBhbiBBc3Npc3RlZC1ieTogdGFnIGhlcmUgOigKTm8g
TExNIHVzZWQgaGVyZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
