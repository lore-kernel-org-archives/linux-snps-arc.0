Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 349AFEEE245
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Sep 2024 07:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idvPELHrrNk91gtmyfsw+f7WUR7ZoERXuIXw/l+79fE=; b=2p+QLwLITYkMY+
	iMZcNNRbshcdmiG7coWQ8ml+pL2o1V415Q0VAO2ih6UQeeLAIczcxq3WhDlWJkHE2RC/gUn4Q6BIR
	Tw0dDpJQgoNnlBeE0JZ6UFJkF6Txli+2VHPpFgxlgzS0FSABK1SC3EE31s+SSrhrT0qV+y5AAd1iy
	piN0wD4+517aHpYf9DeSfyJYbn/PvczR6t7sxr5M66tgQRHOg00URWTGuS+xkVV2iz9wAzFB+n1qL
	8SOjWughrBa7sDJz7gkLlQqoXtohxmX2ys8GQD+3AKYNNtbgWM/W9vNj74K/u1TUmEKF2nMY8aXAg
	uzz81KwdRA5Kt1iBoyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0xP-0000000FBxK-1sJG;
	Fri, 13 Sep 2024 07:43:07 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp0xJ-0000000FBry-3zLk;
	Fri, 13 Sep 2024 07:43:05 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D7BVlo014250;
	Fri, 13 Sep 2024 07:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:content-transfer-encoding:in-reply-to:mime-version; s=
	corp-2023-11-20; bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=; b=
	h+rnHyjdzNE2V8l7QMCyW3ewbHzJ5Lj4ajFKAYVYCoSPkIzRnDJHMEetzc6WbLtL
	VBbgJwUgU29MYsUom0QP/VoaN2AcAA8zxqkBd6OcspmLVeK2yQbveVR8uEGG7ssA
	gUGrb4XOyUAEWbupCUQ2g66V115YWaCNPYnjsGOkJvsOiqaY6io+rEz7JQixBAeX
	kQxRZLiohMyisEof+PeUeaURrItKmSg6NcCIzfplU851cwioK3Wl3/FM6zeRhnGc
	DCa1kOw1Hj4k2+h2nOWAppx0gW6doJidRW15R+Giavy+ENJ3RQzb3iTe0UaQQm1J
	MC1wiaHkMmWZ9B98AKTazg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2vxmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 07:41:48 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48D6JEIm000301;
	Fri, 13 Sep 2024 07:41:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9e0fdb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 07:41:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu06ToTiLWNQm8yLnO7ecnXD7DfAe6sbu1UL5MY8EwxwOMFASyIIcVhTwygbr90LEV0DqvC2cTL+K4ji93N/uoW+P5VckXcv9RvlDEttzQ6xqp467f/4U6UpLrxmu27clKK8it7JXVjvqVD99Qoi75H7iae0AAUREih5Knvm6VNu8s1uBj9XIcNFTn5y91XeivyLg9PTVYwwtRWTAZL452aIiCGHSb7RObHmDXKEUSB9BzAhYZVRmwrkEIc7YHMDpghWZp9TgtS9OFV1CujzQ3wSNfth+z8oKlcy+DusGGocC7+3HC1H3/cO3uHM8CKv2Gc7gPYm5AK2BVwSQ0mYgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=;
 b=tNE16uDoNWsEZDXM4KK7YHiUhNmKmEFgmZfZ43HiZg7cjKhEA4Gm4MosKUCHRV33cev5Rqo8KtYH8nOlECRg7DPv4qMJzvOrNVoG6BvRwkUOutCaxJbKARXQkqrAiahkS44oXaSAnR4HH+JPf+shDQHKm63tYgBRJqrsB1J0UAc8xs4cc+zOB6bBNmhSN0Fp7RoJcxX3FTN2Vqi1xEu3vTrRr54A6RBDvELqPHQEagm5sffQGXB5OQfuMJ2120AX/Qd40ZW9chVPx9Hu6T59bp3MZ6jBQztGQFkAB2tz3KSN2xtWR2MMzGywc6p4gf1BiRJaXuPdgWbLgAiwErxtfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8Qsd+p62WW/LJLUBiJx8P3eOTcqImJGQxkXdHVAdjs=;
 b=gPsRzLaq2Q117oXvXVmItspF0HIAZrwMs99NZ/zJ8nCNcsz9sZuoaC0YhHUzxoUsqcufVrgXu5en7X6oieqVrRKvzPQHp9+jb5EKKH0a5sNf+HEQPkG1qSShwxL/dW7zdTLEjnjPbTGYD4P/9YC3Whl3V+tjw7ZT/xotRvwHn2Q=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by PH0PR10MB4664.namprd10.prod.outlook.com (2603:10b6:510:41::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.9; Fri, 13 Sep
 2024 07:41:38 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.018; Fri, 13 Sep 2024
 07:41:38 +0000
Date: Fri, 13 Sep 2024 08:41:34 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "David S . Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, shuah <shuah@kernel.org>,
        Christoph Hellwig <hch@infradead.org>, Michal Hocko <mhocko@suse.com>,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Chris Torek <chris.torek@gmail.com>,
        Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org,
        linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <d873a994-4efa-4d3a-bdae-5d9a3eff29f2@lucifer.local>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
Content-Disposition: inline
In-Reply-To: <ZuKHpFB+uWuJe2xm@ghost>
X-ClientProxiedBy: LO4P123CA0446.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::19) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|PH0PR10MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 990babd1-23ab-4013-2fc9-08dcd3c77fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGV0b3h2MkZRRHFjR3F1SW93N2hhQVgwWFZrVS9JZU5MWW5yeEhCQU5uNU5P?=
 =?utf-8?B?K3d1Vk9CWnc0aHB4d1RqbnZIZnMvWVFYdkZYVkxXZmRxa2UzemxRSlJyZkxl?=
 =?utf-8?B?ejZGM09pditNamxnUUs3eWcwQlVKZXdWMWNnY2sraUN0MWVMYnc3ZEJWTWlw?=
 =?utf-8?B?SGtYVmMwN0VnZ3BBbHBMZVhDWjY1WkYyYXM0c2lNMDEwQXZvUGU4UzRWQzZP?=
 =?utf-8?B?djZ0M0hPNFB6NXVUYkgxcjJhb3pFcDBLNyt5dE83eGs2QXNlTWV4UmRvMDZQ?=
 =?utf-8?B?TDRjL2xVM2RqbWcyemxjd3ZtSGNPOVBnNUl1bk8rZEtneGlYR3Fhb3VRSHdz?=
 =?utf-8?B?MFVsVjNMWFlXOTNERTB5YmM4Y05MMHF4M2RPUEk2SUx2Wkl6enpvQlhCSksy?=
 =?utf-8?B?Z3l1a2h1Y0hqbkFwY3d3MkhpYTNrSklSRlRwcFEveEpzY2VPMmZ0K2tpZFp2?=
 =?utf-8?B?RERaYTJqNzBodE5wcVp4SS91d2FvMUxXUElhOXZKWjNjU01kQjFjaHFDZ3Vx?=
 =?utf-8?B?OW1ScGlDQjBpN1hvcnZPVUFrdW1Ja3RLUnIybjZ4dXZ2enUyTVdScnJSQzk4?=
 =?utf-8?B?bTZmejRObUZlN2xpMnYySmVQWXI2V2FzeGI2MjJjcnhtSnQzMHF0RGxRenlr?=
 =?utf-8?B?elNGRFBoTWNnNk5rUjFvUHZDZ0lzT0U5d1E0Z2JvMHdOVUdlQlFJNytqQlU1?=
 =?utf-8?B?TkE3S0VDeEtjelJTc0VFd0taU2M1RUoza0JaWlMyejJvREc4VGVCdWxaUnpk?=
 =?utf-8?B?SGMrM0xlVXVjZXZ2SXlWSjN4elRTL2hjU2xXOEtwTXBqOUhOeU5TVTZBUjBO?=
 =?utf-8?B?SVpUemhXc0E0V0hva1FGK01jcHlJc1Bmbkt1K2ptdTNlZVJBUURNdGx2UEoz?=
 =?utf-8?B?MlpPbWFQU292TVpXaE00SzJObDJPNjZydkFUMTJTdDFlSWNVQjJwa1RRSHJl?=
 =?utf-8?B?RUVSVkNJcFhQYlJVZms2Vkp0bi9tVkhwQ1djUjJaaTdsV0xhVTlEY09pSks1?=
 =?utf-8?B?Wjh1Qm9MdDdKMnNYbDhlZlNGbTVrRGpHSER0YTdjUnJUUzZ2eUNUV0Y3cDFP?=
 =?utf-8?B?ZU12d09MdUo2ajJ3NE5Va2krWmhzRUxoRjhFb3gvek43R2JORVJWZzZpV3VC?=
 =?utf-8?B?TnpqY2V2SWNoTVR6QkFKdVloMXIvcHg3cktSdnNFWCtJdUpyUmgxOHhLbU5r?=
 =?utf-8?B?cy9zUzJRN1lCZHpnVmVFL3B6ZjlTa0F0ampFelVjMHQ2eGRxcG9RRHBVNzNp?=
 =?utf-8?B?Vm9xSFF5YkVNc0M5Zi9wZ2VaM2ZLWHA5ekNYVU1ldnhnU1BleWNrOGZzYWNh?=
 =?utf-8?B?VE8xTlhKMUFpM3hLM2cwb292SGduY1U1VGZjWlZIUTQveWYzMjFoSHMxbzR0?=
 =?utf-8?B?S3ZlT0JJNHRkZVpWcHM0bndQWW9QWXBDREhBTVRpMWZqWS9kWUJtMmNEVVVN?=
 =?utf-8?B?aWs1MkQ1dnFLbi9ZdmxCTDdpUytpTlZuQnJrVVFVQkRIUlVyWUlmd2lxNVJ5?=
 =?utf-8?B?bHZpWmx4RzBKMmR2UE5tdWhLNVZWSkE3OVBYeWJEc094WDI0eUxZc2Fadk1s?=
 =?utf-8?B?MTU2TldNZkZxMGVHNENJcWlhVHIwdjdWOWIyZjh4T2c5Z1J3QW9tRFlmay84?=
 =?utf-8?B?ZXc4YUZ0NzJYQVNYNlJyUkdBTURod1hsenNRaUk4MUxGU25iaEphUFIvTlV1?=
 =?utf-8?B?T0g0cmZnendMYUhEc1ZkaG5ESTVZakphUmZtWU1XajlwMGpabjFkM2ZiWEx3?=
 =?utf-8?B?bG9yS0NVOW5hdEpqWHM3TjJZZmJBYjlzWmlHNjBZM2FvS2E5OGNUc3JoMlh4?=
 =?utf-8?B?Nk51VmF6U2dFaXdZbVNWZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmZ1WlVSTUUyY3hvcFgwelVRV0RVWUIyQmNja3lTeThNZ0syODhsdkFjUG5x?=
 =?utf-8?B?elVrODJBMStteVFmTnVTOC9PYjh2WTUwbE8wVmFxWmdoZXJVRjNFcURDckta?=
 =?utf-8?B?Z2lnNlFITmZqYXU3R0hDM1dpL1UzeG8wSUdWSXAzYUFKaGgwRmVid1lXY1cw?=
 =?utf-8?B?aWhUVkVmMm9lN1Q3NSt3KzlQN3BKMnU4UjRzWWtQZk52N3dJcnFDWW14ZHNt?=
 =?utf-8?B?ZjhreDJjK0dOMmliV21abUFCLzVEZEFQcW9YVzNQNXpXOWRaczBkcTBmdEFl?=
 =?utf-8?B?cThtWkVISi9OVGJnVUNwOFFac0d3NzZtb09JSG9iU092bnp4a3pqRjJoQVJk?=
 =?utf-8?B?b2dES0lMeUkzS1M1R3pWam1zSC9DN2NRcnZSK1psTHlaZ1ZYaE9SWWZuUUFS?=
 =?utf-8?B?Q0FsZ2FpK1dDS0JMbVFwNzR4QkZ2NnUwd0tPNGsybDBOZloxRjhNUWtRenZL?=
 =?utf-8?B?amJDT3FOUWZ4VlZJaXVweU5kenVqbnNlSXRseFJYbWRDdDkrcTV6SDBxQmRu?=
 =?utf-8?B?cVFITXJZR0tXWEJUV0tEck9XcjFxVTdaMnI1cjlpNnl1dEtRQlUyVDBTT2hX?=
 =?utf-8?B?WUY3eDQ1YTdORGRlWmxDSGlnQnNBUkkwdTdPak1RMzlPMmZHeHdKMkIxYWFQ?=
 =?utf-8?B?b05leTJqYmlZd2MrZFJ6d1FIRzFTZFZRQnZnV0RJM0hSQjdnSTRHWE54SUZo?=
 =?utf-8?B?Ykw5T0NDY2twaTU4RnZ2a3pQMUxmMDVvSXFjcGY4clBTVlI1TjMzaVRreFBX?=
 =?utf-8?B?UTZ6MTYyNnJObi9pMjltd2p1UXZKYlZ0OFdQNE9wK1ZrK3paTXRaK041KzdI?=
 =?utf-8?B?dlFjQStoak1qZXU2WFc2QWR6QVh1TWN5bW1VOXMvd0hKZGVTaHJqNGF0TTRl?=
 =?utf-8?B?Q3RWcXYvM28xZXE5V1RPWXVDRmdUekovdjIyZmxQc1VpVGFvRFVMRExhZmYx?=
 =?utf-8?B?VWJiUDV5Y210V0dIck9nV1BRQU1pL1NVTm9kbVRXSG1oWFovM0s4K3BIUXc0?=
 =?utf-8?B?K0lTcWxuVVc5cWJDR2tGK3ZaM3ErWFRpSjNxUlVRMmJFRCtCWlQyWDNPdG1N?=
 =?utf-8?B?MDViYzhraGk2UzVkbkE1NWRiWGNEbTBMY3FIS0ZZUjFQaTV2TFZGWUtmTXlT?=
 =?utf-8?B?TnBZQ1hWaDNoSjZ6UCtpWXBIZVBoYTZOSkJZWWVJOEhOWnJWYmNTLzNoVTRC?=
 =?utf-8?B?L0ZJYmE0MTc1NVE3aUMzMlM4TFlobnI3NDBZeWo4cUlkdkFDcFRTMGk0cUV6?=
 =?utf-8?B?Tzl1enZEU2VZM2xuakptMDdudytxVSt5RmxTeVRuaXk5OFVCSUs4MHJXN0ho?=
 =?utf-8?B?VTlWcEJvc1dGRzJ0NXVkaWV3R09ydTM2R2VOZENyaWpRSlZoR1FvSGxEUndV?=
 =?utf-8?B?UFo1Z1NzVDZERkhKSWNmYVZwaXhidGFHQVlwdFNKYTJ4Y2NUV2hsVlJGZDcw?=
 =?utf-8?B?OGNZRmRWL0E4cE9CVUZDbTVaaFcya3prZGExTXFiZTd3SHl2LzJ2bGlWdlpo?=
 =?utf-8?B?UW93VmEweWlWM216ME0yZ0pmZEpsMk5ONDhtSGtWbGNkaFN1aFZ4SlU2aTVK?=
 =?utf-8?B?TDlvOHd5bzFDS0YvL3I4aFlHUmZnN3BrVXBwb2o1K0pEMHJqS3l6MWhaT3ov?=
 =?utf-8?B?bDJ6b1JOdlhGelBVOU5TT21OYkpJWXU1RGxSb0tPSnp2Ny81d2RvSjArelgv?=
 =?utf-8?B?andXY1FKMExzOHVBTFQ4V1NBZ0UybVVWWHNWU0FMM09wZmZJN1Q1dUpzR05w?=
 =?utf-8?B?UmtWN0lkaFBpQVpWdjNYVXB3VGpCM1JSZ0laWVlZR3lXdjhQRWtObTIvaWtG?=
 =?utf-8?B?WjBnazk0UGxzakxVYklKN2hla1dMQXRQMkhMS0tKb1hGdzlhMGVFVFRvUm1V?=
 =?utf-8?B?Z1ZBUmMvRnJoL01FU3VxcDg2b1V1ZWRWeFpYMkhLdE1MU01nbm1XaWVZbzdm?=
 =?utf-8?B?WXpuSjN0SkM0eHlLYVh3K291UmhiakZFbmdHRG1oMFRldnRyMHN3RzU5dFVk?=
 =?utf-8?B?SVBFRTg3aHlNOFA0cFBvcHNFRU5ubU1vYWlSUzdRNzJPdFJvaW9sekhLcGx0?=
 =?utf-8?B?VDdnZVZsejVyTDFKVTcwTWJNUGNDVWVkQTlVbTJpYWV4RGhEQiszTXZEVkJS?=
 =?utf-8?B?OXp3R0hOdkxDeFl5bU5BbnNzcHBCQVhTMUZ4bVMyUm84WnZianhkVXpXQVFJ?=
 =?utf-8?B?M0l3OUxKZUdWWWc3WUZMVXR3SGtweU0zSld3U2JzK1BhMkptb1U2QklJa0kw?=
 =?utf-8?B?SERxQ0hZYkdpWVh2Ny90VEYvVTRBPT0=?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Qa0fWl7zk7gHEBDs/9OGNnrF/w7hH2W5IU7QlUAYbRF0HIG9jvoGs4TKD9EmEJGhyTIqbmg9G+icBLmro35ixXBuzrrnzv3IKNu7Ko/iliDN40JqSqerTeG/hh3crm+hFpxvuZDluNfPUDNtq4uhxZVIZE+B6jjUmYZiizSk0mmG6kJf0QhycoRAZukLNrh53Ndpp1mgqPwtQXr3kkBBj2OSIkma+7kDU5o/q+8nyZI/iyU0KSDpLCOlOy0D4y8N0aCLYfGAfSsy8ayStw1E++uvxIghUln4gPxL4eKQviY0H5fyJ93uP77YuckD6wnT022FrHvlAvIqNMs/qWVdKxFUhEIR6pEd7b5tKe108ZtN2X+q8t/ZSt+YWYA9yYuAaXM9GUVyr7RmPzU/qI2knTAukFTh+0BqHwUUtVhXfhRSGAzvwpJAXPxN5P4L297rLtLh7KxV+m5+NAPi138HIi4r4u7F7k10Pd2oCEyye9c92lm4/vNwOrdKg/GWIb3iIqeue3GzDYcQYcq/Eckp4TKugZQE1qiBxjMzfIwUL7e0oSQpcDxjlRkh5edv74BzkWkXyYHL8bgVCz1ih6WP7Btd+wb9BrbL+JZ2QAFBesI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990babd1-23ab-4013-2fc9-08dcd3c77fd9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:41:38.0352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSM31kaqwQTvTR9Q2/R/XE/o7zSbViY03Ft7YTMXSqmjOH+6q+OVStQ5koJz09O4cMOKfYDZAMml7IlUI2yqsfXHe4OOjpJX2tnUTiGakH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_04,2024-09-12_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409130052
X-Proofpoint-GUID: BKO-C6EVIEUXnKZ6RDOnEyJcDe-QaW6n
X-Proofpoint-ORIG-GUID: BKO-C6EVIEUXnKZ6RDOnEyJcDe-QaW6n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_004302_307587_0DE2D91F 
X-CRM114-Status: GOOD (  13.80  )
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

T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMTE6MTg6MTJQTSBHTVQsIENoYXJsaWUgSmVua2lucyB3
cm90ZToKPiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAwNzoyMToyN1BNICswMTAwLCBDYXRhbGlu
IE1hcmluYXMgd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAxMCwgMjAyNCBhdCAwNTo0NTowN1BNIC0w
NzAwLCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0
IDAzOjA4OjE0UE0gLTA0MDAsIExpYW0gUi4gSG93bGV0dCB3cm90ZToKPiA+ID4gPiAqIENhdGFs
aW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJpbmFzQGFybS5jb20+IFsyNDA5MDYgMDc6NDRdOgo+ID4g
PiA+ID4gT24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMDk6NTU6NDJBTSArMDAwMCwgQXJuZCBCZXJn
bWFubiB3cm90ZToKPiA+ID4gPiA+ID4gT24gRnJpLCBTZXAgNiwgMjAyNCwgYXQgMDk6MTQsIEd1
byBSZW4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gRnJpLCBTZXAgNiwgMjAyNCBhdCAzOjE44oCv
UE0gQXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4+IEl0
J3MgYWxzbyB1bmNsZWFyIHRvIG1lIGhvdyB3ZSB3YW50IHRoaXMgZmxhZyB0byBpbnRlcmFjdCB3
aXRoCj4gPiA+ID4gPiA+ID4+IHRoZSBleGlzdGluZyBsb2dpYyBpbiBhcmNoX2dldF9tbWFwX2Vu
ZCgpLCB3aGljaCBhdHRlbXB0cyB0bwo+ID4gPiA+ID4gPiA+PiBsaW1pdCB0aGUgZGVmYXVsdCBt
YXBwaW5nIHRvIGEgNDctYml0IGFkZHJlc3Mgc3BhY2UgYWxyZWFkeS4KPiA+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiA+IFRvIG9wdGltaXplIFJJU0MtViBwcm9ncmVzcywgSSByZWNvbW1lbmQ6Cj4g
PiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiBTdGVwIDE6IEFwcHJvdmUgdGhlIHBhdGNoLgo+ID4g
PiA+ID4gPiA+IFN0ZXAgMjogVXBkYXRlIEdvIGFuZCBPcGVuSkRLJ3MgUklTQy1WIGJhY2tlbmQg
dG8gdXRpbGl6ZSBpdC4KPiA+ID4gPiA+ID4gPiBTdGVwIDM6IFdhaXQgYXBwcm94aW1hdGVseSBz
ZXZlcmFsIGl0ZXJhdGlvbnMgZm9yIEdvICYgT3BlbkpESwo+ID4gPiA+ID4gPiA+IFN0ZXAgNDog
UmVtb3ZlIHRoZSA0Ny1iaXQgY29uc3RyYWludCBpbiBhcmNoX2dldF9tbWFwX2VuZCgpCj4gPgo+
ID4gUG9pbnQgNCBpcyBhbiBBQkkgY2hhbmdlLiBXaGF0IGd1YXJhbnRlZXMgdGhhdCB0aGVyZSBp
c24ndCBzdGlsbAo+ID4gc29mdHdhcmUgb3V0IHRoZXJlIHRoYXQgcmVsaWVzIG9uIHRoZSBvbGQg
YmVoYXZpb3VyPwo+Cj4gWWVhaCBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJlIGRlc2lyYWJsZSB0
byByZW1vdmUgdGhlIDQ3IGJpdAo+IGNvbnN0cmFpbnQgaW4gYXJjaGl0ZWN0dXJlcyB0aGF0IGFs
cmVhZHkgaGF2ZSBpdC4KPgo+ID4KPiA+ID4gPiA+ID4gSSByZWFsbHkgd2FudCB0byBmaXJzdCBz
ZWUgYSBwbGF1c2libGUgZXhwbGFuYXRpb24gYWJvdXQgd2h5Cj4gPiA+ID4gPiA+IFJJU0MtViBj
YW4ndCBqdXN0IGltcGxlbWVudCB0aGlzIHVzaW5nIGEgNDctYml0IERFRkFVTFRfTUFQX1dJTkRP
Vwo+ID4gPiA+ID4gPiBsaWtlIGFsbCB0aGUgb3RoZXIgbWFqb3IgYXJjaGl0ZWN0dXJlcyAoeDg2
LCBhcm02NCwgcG93ZXJwYzY0KSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBGV0lXIGFybTY0IGFjdHVh
bGx5IGxpbWl0cyBERUZBVUxUX01BUF9XSU5ET1cgdG8gNDgtYml0IGluIHRoZSBkZWZhdWx0Cj4g
PiA+ID4gPiBjb25maWd1cmF0aW9uLiBXZSBlbmQgdXAgd2l0aCBhIDQ3LWJpdCB3aXRoIDE2SyBw
YWdlcyBidXQgZm9yIGEKPiA+ID4gPiA+IGRpZmZlcmVudCByZWFzb24gdGhhdCBoYXMgdG8gZG8g
d2l0aCBMUEEyIHN1cHBvcnQgKEkgZG91YnQgd2UgbmVlZCB0aGlzCj4gPiA+ID4gPiBmb3IgdGhl
IHVzZXIgbWFwcGluZyBidXQgd2UgbmVlZCB0byB1bnRhbmdsZSBzb21lIG9mIHRoZSBtYWNyb3Mg
dGhlcmU7Cj4gPiA+ID4gPiB0aGF0J3MgZm9yIGEgc2VwYXJhdGUgZGlzY3Vzc2lvbikuCj4gPiA+
ID4gPgo+ID4gPiA+ID4gVGhhdCBzYWlkLCB3ZSBoYXZlbid0IGVuY291bnRlcmVkIGFueSB1c2Vy
IHNwYWNlIHByb2JsZW1zIHdpdGggYSA0OC1iaXQKPiA+ID4gPiA+IERFRkFVTFRfTUFQX1dJTkRP
Vy4gU28gSSBhbHNvIHRoaW5rIFJJU0MtViBzaG91bGQgZm9sbG93IGEgc2ltaWxhcgo+ID4gPiA+
ID4gYXBwcm9hY2ggKDQ3IG9yIDQ4IGJpdCBkZWZhdWx0IGxpbWl0KS4gQmV0dGVyIHRvIGhhdmUg
c29tZSBBQkkKPiA+ID4gPiA+IGNvbnNpc3RlbmN5IGJldHdlZW4gYXJjaGl0ZWN0dXJlcy4gT25l
IGNhbiBzdGlsbCBhc2sgZm9yIGFkZHJlc3NlcyBhYm92ZQo+ID4gPiA+ID4gdGhpcyBkZWZhdWx0
IGxpbWl0IHZpYSBtbWFwKCkuCj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHRoYXQgaXMgYmVzdCBh
cyB3ZWxsLgo+ID4gPiA+Cj4gPiA+ID4gQ2FuIHdlIHBsZWFzZSBqdXN0IGRvIHdoYXQgeDg2IGFu
ZCBhcm02NCBkb2VzPwo+ID4gPgo+ID4gPiBJIHJlc3BvbmRlZCB0byBBcm5kIGluIHRoZSBvdGhl
ciB0aHJlYWQsIGJ1dCBJIGFtIHN0aWxsIG5vdCBjb252aW5jZWQKPiA+ID4gdGhhdCB0aGUgc29s
dXRpb24gdGhhdCB4ODYgYW5kIGFybTY0IGhhdmUgc2VsZWN0ZWQgaXMgdGhlIGJlc3Qgc29sdXRp
b24uCj4gPiA+IFRoZSBzb2x1dGlvbiBvZiBkZWZhdWx0aW5nIHRvIDQ3IGJpdHMgZG9lcyBhbGxv
dyBhcHBsaWNhdGlvbnMgdGhlCj4gPiA+IGFiaWxpdHkgdG8gZ2V0IGFkZHJlc3NlcyB0aGF0IGFy
ZSBiZWxvdyA0NyBiaXRzLiBIb3dldmVyLCBkdWUgdG8KPiA+ID4gZGlmZmVyZW5jZXMgYWNyb3Nz
IGFyY2hpdGVjdHVyZXMgaXQgZG9lc24ndCBzZWVtIHBvc3NpYmxlIHRvIGhhdmUgYWxsCj4gPiA+
IGFyY2hpdGVjdHVyZXMgZGVmYXVsdCB0byB0aGUgc2FtZSB2YWx1ZS4gQWRkaXRpb25hbGx5LCB0
aGlzIGZsYWcgd2lsbCBiZQo+ID4gPiBhYmxlIHRvIGhlbHAgdXNlcnMgYXZvaWQgcG90ZW50aWFs
IGJ1Z3Mgd2hlcmUgYSBoaW50IGFkZHJlc3MgaXMgcGFzc2VkCj4gPiA+IHRoYXQgY2F1c2VzIHVw
cGVyIGJpdHMgb2YgYSBWQSB0byBiZSB1c2VkLgo+ID4KPiA+IFRoZSByZWFzb24gd2UgYWRkZWQg
dGhpcyBsaW1pdCBvbiBhcm02NCBpcyB0aGF0IHdlIG5vdGljZWQgcHJvZ3JhbXMKPiA+IHVzaW5n
IHRoZSB0b3AgOCBiaXRzIG9mIGEgNjQtYml0IHBvaW50ZXIgZm9yIGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24uCj4gPiBJSVJDLCBpdCB3YXNuJ3QgZXZlbiBvcGVuSkRLIGJ1dCBzb21lIEphdmFTY3Jp
cHQgSklULiBXZSBjb3VsZCBoYXZlCj4gPiB0YXVnaHQgdGhvc2UgcHJvZ3JhbXMgb2YgYSBuZXcg
ZmxhZyBidXQgc2luY2Ugd2UgY291bGRuJ3QgdGVsbCBob3cgbWFueQo+ID4gYXJlIG91dCB0aGVy
ZSwgaXQgd2FzIHRoZSBzYWZlc3QgdG8gZGVmYXVsdCB0byBhIHNtYWxsZXIgbGltaXQgYW5kIG9w
dAo+ID4gaW4gdG8gdGhlIGhpZ2hlciBvbmUuIFN1Y2ggb3B0LWluIGlzIHZpYSBtbWFwKCkgYnV0
IGlmIHlvdSBwcmVmZXIgYQo+ID4gcHJjdGwoKSBmbGFnLCB0aGF0J3MgZmluZSBieSBtZSBhcyB3
ZWxsICh0aG91Z2ggSSB0aGluayB0aGlzIHNob3VsZCBiZQo+ID4gb3B0LWluIHRvIGhpZ2hlciBh
ZGRyZXNzZXMgcmF0aGVyIHRoYW4gb3B0LW91dCBvZiB0aGUgaGlnaGVyIGFkZHJlc3NlcykuCj4K
PiBUaGUgbW1hcCgpIGZsYWcgd2FzIHVzZWQgaW4gcHJldmlvdXMgdmVyc2lvbnMgYnV0IHdhcyBk
ZWNpZGVkIGFnYWluc3QKPiBiZWNhdXNlIHRoaXMgZmVhdHVyZSBpcyBtb3JlIHVzZWZ1bCBpZiBp
dCBpcyBwcm9jZXNzLXdpZGUuIEEKPiBwZXJzb25hbGl0eSgpIGZsYWcgd2FzIGNob3NlbiBpbnN0
ZWFkIG9mIGEgcHJjdGwoKSBmbGFnIGJlY2F1c2UgdGhlcmUKPiBleGlzdGVkIG90aGVyIGZsYWdz
IGluIHBlcnNvbmFsaXR5KCkgdGhhdCB3ZXJlIHNpbWlsYXIuIEkgYW0gdGVtcHRlZCB0bwo+IHVz
ZSBwcmN0bCgpIGhvd2V2ZXIgYmVjYXVzZSB0aGVuIHdlIGNvdWxkIGhhdmUgYW4gYWRkaXRpb25h
bCBhcmcgdG8KPiBzZWxlY3QgdGhlIGV4YWN0IG51bWJlciBvZiBiaXRzIHRoYXQgc2hvdWxkIGJl
IHJlc2VydmVkIChyYXRoZXIgdGhhbgo+IGJlaW5nIGZpeGVkIGF0IDQ3IGJpdHMpLgoKSSBhbSB2
ZXJ5IG11Y2ggbm90IGluIGZhdm91ciBvZiBhIHByY3RsKCksIGl0IHdvdWxkIHJlcXVpcmUgdXMg
dG8gYWRkIHN0YXRlCmxpbWl0aW5nIHRoZSBhZGRyZXNzIHNwYWNlIGFuZCB0aGUgdGltaW5nIG9m
IGl0IGJlY29tZXMgY3JpdGljYWwuIFRoZW4gd2UKaGF2ZSB0aGUgc2FtZSBpc3N1ZSB3ZSBkbyB3
aXRoIHRoZSBvdGhlciBwcm9wb3NhbHMgYXMgdG8gLSB3aGF0IGhhcHBlbnMgaWYKdGhpcyBpcyB0
b28gbG93PwoKV2hhdCBpcyAndG9vIGxvdycgdmFyaWVzIGJ5IGFyY2hpdGVjdHVyZSwgYW5kIGZv
ciAzMi1iaXQgYXJjaGl0ZWN0dXJlcwpjb3VsZCBnZXQgcXVpdGUuLi4gcHJvYmxlbWF0aWMuCgpB
bmQgYWdhaW4sIHdoYSBpcyB0aGUgUm9JIGhlcmUgLSB3ZSBpbnRyb2R1Y2luZyBtYWludGVuYW5j
ZSBidXJkZW4gYW5kIGVkZ2UKY2FzZXMgdnMuIHRoZSB4ODYgc29sdXRpb24gaW4gb3JkZXIgdG8u
Li4gYWNjb21tb2RhdGUgdGhpbmdzIHRoYXQgbmVlZCBtb3JlCnRoYW4gMTI4IFRpQiBvZiBhZGRy
ZXNzIHNwYWNlPyBBIHByb2JsZW0gdGhhdCBkb2VzIG5vdCBhcHBlYXIgdG8gZXhpc3QgaW4KcmVh
bGl0eT8KCkkgc3VnZ2VzdGVkIHRoZSBwZXJzb25hbGl0eSBhcHByb2FjaCBhcyB0aGUgbGVhc3Qg
aW1wYWN0ZnVsIGNvbXByb21pc2Ugd2F5Cm9mIHRoaXMgc2VyaWVzIHdvcmtpbmcsIGJ1dCBJIHRo
aW5rIGFmdGVyIHdoYXQgQXJuZCBoYXMgc2FpZCAoYW5kIHBsZWFzZQpmb3JnaXZlIG1lIGlmIEkn
dmUgbWlzc2VkIGZ1cnRoZXIgZGlzY3Vzc2lvbiBoYXZlIGJlZW4gZGlwcGluZyBpbiBhbmQgb3V0
Cm9mIHRoaXMhKSAtIGFkYXB0aW5nIHJpc2MgdiB0byB0aGUgYXBwcm9hY2ggd2UgdGFrZSBlbHNl
d2hlcmUgc2VlbXMgdGhlCm1vc3Qgc2Vuc2libGUgc29sdXRpb24gdG8gbWUuCgpUaGlzIHJlbWFp
bnMgc29tZXRoaW5nIHdlIGNhbiByZXZpc2l0IGluIGZ1dHVyZSBpZiB0aGlzIHR1cm5zIG91dCB0
byBiZQplZ3JlZ2lvdXMuCgo+Cj4gT3B0aW5nLWluIHRvIHRoZSBoaWdoZXIgYWRkcmVzcyBzcGFj
ZSBpcyByZWFzb25hYmxlLiBIb3dldmVyLCBpdCBpcyBub3QKPiBteSBwcmVmZXJlbmNlLCBiZWNh
dXNlIHRoZSBwdXJwb3NlIG9mIHRoaXMgZmxhZyBpcyB0byBlbnN1cmUgdGhhdAo+IGFsbG9jYXRp
b25zIGRvIG5vdCBleGNlZWQgNDctYml0cywgc28gaXQgaXMgYSBjbGVhcmVyIEFCSSB0byBoYXZl
IHRoZQo+IGFwcGxpY2F0aW9ucyB0aGF0IHdhbnQgdGhpcyBndWFyYW50ZWUgdG8gYmUgdGhlIG9u
ZXMgc2V0dGluZyB0aGUgZmxhZywKPiByYXRoZXIgdGhhbiB0aGUgYXBwbGljYXRpb25zIHRoYXQg
d2FudCB0aGUgaGlnaGVyIGJpdHMgc2V0dGluZyB0aGUgZmxhZy4KClBlcmZlY3QgaXMgdGhlIGVu
ZW15IG9mIHRoZSBnb29kIDopIGFuZCBhbiBpZGVhbGlzZWQgc29sdXRpb24gbWF5IG5vdCBlbmQK
dXAgYmVpbmcgc29tZXRoaW5nIGV2ZXJ5Ym9keSBjYW4gYWdyZWUgb24uCgo+Cj4gLSBDaGFybGll
Cj4KPiA+Cj4gPiAtLQo+ID4gQ2F0YWxpbgo+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
