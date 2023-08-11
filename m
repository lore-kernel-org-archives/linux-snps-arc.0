Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732B4C001DE
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Aug 2023 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqqXVlnJZhlVG1FyKV+3p5esvsYRcsAkajVnDtuXBgg=; b=M6N8hmd91ca8C4
	WOchB+n9fQSGdCiaERYcsfW4WsfLRfOsfv3Lo4QSjBqKZocVeCwH6b6kCBo6flUCkQT1+hC8R7bs8
	hOCLiaR4Vervr4vcs1lD25dUD1H+GgAfobnOLmqGLKhRPi+VOAzpxSEOLRhvxIhAM3zMkmF3twU89
	/GoUQAtf3M2TuIFvbtHN2vy1coXtZ6VTD3KSl3fJxed8B8lrbl0hBVZNDQjOLulWOm2xydXK/DGCE
	VGoDYflO6hI1W9IngEGWWOacUqlKiQ/FQYEe7GaPZQH/kOQsLCqlgpg5feQ7JxBHNAvQaTbsZo0Xx
	BHY4V4RL5H+cXwoK0PDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWpc-00BMCU-1I;
	Fri, 11 Aug 2023 18:25:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUWpS-00BM9i-2c;
	Fri, 11 Aug 2023 18:25:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2BA364C29;
	Fri, 11 Aug 2023 18:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BC4C433C8;
	Fri, 11 Aug 2023 18:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691778341;
	bh=J5jMJWNe5mxefsfwYpjk94ucCqvKpHDhJ2RLFLWPzvE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gz052yUM1XxLU/RgjOg34wukKcdr6mu92lg4kRvftL4t+JLmQb8r1u1actRxxcApf
	 PjHlYbsUsWZ+bKIaVoc7rK52krQ4OWPLnEH93QFvpXRAbigb2wSUKLi45TU/nHEb+C
	 Jwl9WfjJwBcQjOTRkBTLUH9d7syGI0QxxJS6cM+B4sNpqdMSIJVnJTbcdGoGTSTSlZ
	 PeS+VwcMkTke4e6X7PE/F46DP+6t406NKl/ODdSSnHdrM9/eHvIbao7c9+sM5I0D9t
	 oKICESQTk0FrGQu3zXtHyOu/DayhYLn0OVumhMRyOLFfjSFrRZmIStkSQKluPFVJ8K
	 zZHStULYsZlMQ==
Message-ID: <2cb4c584-fb4a-5781-f74d-902416749ed4@kernel.org>
Date: Fri, 11 Aug 2023 11:25:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 16/17] [RFC] arch: turn -Wmissing-prototypes off
 conditionally
Content-Language: en-US
To: Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, x86@kernel.org,
 Borislav Petkov <bp@alien8.de>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Guenter Roeck <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-next@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, Christian Brauner <brauner@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Youling Tang <tangyouling@loongson.cn>, Tiezhu Yang
 <yangtiezhu@loongson.cn>, Masahiro Yamada <masahiroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Xin Li <xin3.li@intel.com>,
 Nhat Pham <nphamcs@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Marc_Aur=c3=a8le_La_France?= <tsi@tuyoix.net>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-17-arnd@kernel.org>
 <CAJF2gTRdbXOEBNPN14y_ZUwBJ15qBG929BDspk0sqPo2sn=L-Q@mail.gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <CAJF2gTRdbXOEBNPN14y_ZUwBJ15qBG929BDspk0sqPo2sn=L-Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_112544_023427_10E3FD99 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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


On 8/10/23 19:33, Guo Ren wrote:
> Thx, Arnd, I will clean them up for the csky part.

Likewise, I'll clean up ARC errors this weekend !
It seems most of therm are in the category you mentioned. Non static but 
only used by asm code.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
