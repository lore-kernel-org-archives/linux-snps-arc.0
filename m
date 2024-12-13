Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20FBE7717F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Dec 2024 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pInRAVCMNDqafSKw1t5qaEdSpHT6zyQoNGHWza3m9I0=; b=u64S474hbfyIJp
	BpkInoMzAn02NPr9/0hW0bN7Ygd4d/psRuAe0FvTMKsSTHuZFPZsB1WeR1atw61wD0OnYg8E6yOc2
	74Mtr+YuuWcD/n4qyXu3Wx3yC6se0G64UL+vquQNRbP43lCFShp055lL6qE624K6QhwybnCXdBjKV
	5dsg80Gyn0AVB9EL+q1BEIksu6Z8rSCPyoFU16EdzKm5CC19OtJ3L0N4Eu+9ruJDZ40RaeoJ1pav+
	o5xKxc+xU6P6RV+Smz06wCGmzeCNkr/Q0SE31dDNLi0GR4gtl+uFH+WSnHTi3kV+4tYenOV/2Spcj
	Fqun0m7SplLfiIogwkXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1AI-000000036gt-28lZ;
	Fri, 13 Dec 2024 08:36:50 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1AG-000000036fd-0GM8
	for linux-snps-arc@lists.infradead.org;
	Fri, 13 Dec 2024 08:36:49 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d8e8445219so13459616d6.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 13 Dec 2024 00:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734079007; x=1734683807; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRt1MXIvY7wy4Sl3wPWxh5TWbRsTuTxrC9cGCSyNao0=;
        b=mCE+9qJDZexckMIYZZP0+G9e8eFFh8n3D41LOUzlRn1QkFVf81FFPUrvtrnw38Ax87
         jBjNUfPOsX+mzrzxg869zoMTB4gYhZuQjbzpA752qjlhhrObIYx0WhdhhbcRMoIpjPMz
         WhE3lDJ7Aakkq4zWLLHI0jVDd3+bd7vj/oinXBwaeQLUo63J6agBucinA8ybMTtrAJB4
         kfhblNKCcWFP3vOmRnriKcNBOJtqeLPcL5GDc6FC9nYcnqW5oPB1aXW7paNNCzF5leoM
         lnVuNumNvlqNGxMiM0Tq12iJ/FwqWP/A1TFVIkdeeiyXt8oGrwQ7Hhf2Mjf3QZcqs2uQ
         KxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734079007; x=1734683807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRt1MXIvY7wy4Sl3wPWxh5TWbRsTuTxrC9cGCSyNao0=;
        b=TlJYp9OtkZta0t3ufN5syeEFJQIV39xkjONNhILrC2KYxSTy1o5w/srecfUZZFr/gU
         zxp1n8vpCc1+1uaHWET2/XrO1ViWdfVKRMQFBG/Q0JkooMgRyVWmRxKs7JWcR6FCadIW
         FHBmYWkx6CoTpxFKc2GzW9RGQAU8l7JM/3vAGkMvJwtFjSBWwWOZsQhSP3IL2FCm/aKh
         +dOCCFNmaHf28HWuE+wjO7Qr133548LZR5ynwBvhZ5+zwDQBNVaNx6XVofJ5FKK9SX5L
         1DJ909GgaTnvHGSq+SHIvGdBSMQTAmHqW3UXGnL0A8GffNr+nRLT6rdCCAieu2fDc+XT
         i2bA==
X-Forwarded-Encrypted: i=1; AJvYcCUm1pwpp75PVJR6hJ9crShRiKA7+SPsDsFSUvtv3hMhKNOI/cGZdYKAnj0DAODY8HdALG5+zVVuk7zm9fzpfg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx371+7B1Ul6f7f95q9XU9gck2uRksDFAk5WUjgPF62VEmgtz+K
	Hm5cLRBkNEMhY6tvrZIeYJGjjNx7w2MZaUJQyq7FlHPcS/wnrAKNyB6aD9x0Uj+wWK27IxKP7T1
	Ki4KTgldxrAa+dKc0eBPokh3AkJw=
X-Gm-Gg: ASbGncs3nbJMdsXQgRPf/GfkGrKO5TDiUtCiUlbv07/NdlUwP6M4T8YOt3ue46c7iS9
	PDEsbv2F8ihJT6QOakzQiRZpIk6Xf4fjVKKgWQYA=
X-Google-Smtp-Source: AGHT+IEt1cOWo4VsTmw/6EdhS/KZ00UrsyLMhWiucugMYEeldbYzELrBj4wzlhuYfpJWzQ/nKiHjbqdqIiCiPqivAYk=
X-Received: by 2002:a05:6214:301e:b0:6cb:ee08:c1e8 with SMTP id
 6a1803df08f44-6dc8ca869aamr25025096d6.23.1734079006748; Fri, 13 Dec 2024
 00:36:46 -0800 (PST)
MIME-Version: 1.0
References: <20241213054610.55843-1-laoar.shao@gmail.com> <20241213054610.55843-2-laoar.shao@gmail.com>
 <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
In-Reply-To: <Z1vq2-V7vB5KhBR9@pathway.suse.cz>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 13 Dec 2024 16:36:10 +0800
Message-ID: <CALOAHbAD-USZYry6dToxDTM-OO1+Rz0g6XQkCjhzhWDt7g4MGw@mail.gmail.com>
Subject: Re: [PATCH 1/7] vsprintf: Add %pTN to print task name
To: Petr Mladek <pmladek@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, x86@kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-wireless@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	ocfs2-devel@lists.linux.dev, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_003648_097857_4A46FABF 
X-CRM114-Status: GOOD (  14.05  )
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

T24gRnJpLCBEZWMgMTMsIDIwMjQgYXQgNDowNeKAr1BNIFBldHIgTWxhZGVrIDxwbWxhZGVrQHN1
c2UuY29tPiB3cm90ZToKPgo+IE9uIEZyaSAyMDI0LTEyLTEzIDEzOjQ2OjA0LCBZYWZhbmcgU2hh
byB3cm90ZToKPiA+IFNpbmNlIHRoZSB0YXNrLT5jb21tIGlzIGd1YXJhbnRlZWQgdG8gYmUgTlVM
LXRlcm5pbWF0ZWQsIHdlIGNhbiBwcmludCBpdAo+ID4gZGlyZWN0bHkuIEFkZCBhIG5ldyB2c25w
cmludGYgZm9ybWF0IHNwZWNpZmllciAiJXBUTiIgdG8gcHJpbnQgdGFzayBjb21tLAo+ID4gd2hl
cmUgJ3AnIHJlcHJlc2VudHMgdGhlIHRhc2sgUG9pbnRlciwgJ1QnIHN0YW5kcyBmb3IgVGFzaywg
YW5kICdOJyBkZW5vdHMKPiA+IE5hbWUuIFdpdGggdGhpcyBhYnN0cmFjdGlvbiwgdGhlIHVzZXIg
bm8gbG9uZ2VyIG5lZWRzIHRvIGNhcmUgYWJvdXQKPiA+IHJldHJpZXZpbmcgdGFzayBuYW1lLgo+
Cj4gV2hhdCBpcyB0aGUgYWR2YW50YWdlLCBwbGVhc2U/CgpUaGUgYWR2YW50YWdlIGlzIHRoYXQg
aXQgcHJvdmlkZXMgdGhlIGZsZXhpYmlsaXR5IHRvIG1vZGlmeSB0aGUgY29tbQpyZXByZXNlbnRh
dGlvbiB0byBtZWV0IGZ1dHVyZSByZXF1aXJlbWVudHMuIEZvciBpbnN0YW5jZSwgd2UgY291bGQK
cmVuYW1lIGl0IHRvICJ0YXNrX25hbWUiIGFuZCBpbmNyZWFzZSBpdHMgc2l6ZS4KCj4KPiBIb25l
c3RseSwgSSBiZWxpZXZlIHRoYXQgdGhlIG1lYW5pbmcgb2YKPgo+ICAgICAgICAgcHJpbnRrKCIl
c1xuIiwgdGFzay0+Y29tbSk7Cj4KPiBpcyBtdWNoIG1vcmUgY2xlYXIgdGhhbiB1c2luZyBhIGNy
eXB0aWMgJXBYWVogbW9kaWZpZXI6Cj4KPiAgICAgICAgIHByaW50aygiJXBUTlxuIiwgdGFzayk7
Cj4KPgo+IFRoZSAlcFhZWiBtb2RpZmllcnMgbWFrZXMgc2Vuc2Ugb25seSB3aGVuIHRoZSBmb3Jt
YXR0aW5nIG9mIHRoZSBwcmludGVkCj4gaW5mb3JtYXRpb24gbmVlZHMgc29tZSBwcm9jZXNzaW5n
LiBCdXQgdGhpcyBpcyBhIHBsYWluIHN0cmluZy4KClRoYXQgbWFrZXMgc2Vuc2UgdG8gbWUuCgo+
IElNSE8sIGl0IGlzIG5vdCB3b3J0aCBpdC4gSW4gZmFjdCwgSSBiZWxpZXZlIHRoYXQgaXQgaXMg
YQo+IGNvdW50ZXIgcHJvZHVjdGl2ZS4KCkxpbnVzLCB3aGF0IGFyZSB5b3VyIHRob3VnaHRzPwoK
Ci0tClJlZ2FyZHMKWWFmYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
