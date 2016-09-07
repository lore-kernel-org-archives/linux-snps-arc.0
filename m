From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 7 Sep 2016 09:38:25 -0700
Subject: WTF: patch "[PATCH] ARC: Support syscall ABI v4" was seriously
 submitted to be applied to the 4.7-stable tree?
In-Reply-To: <20160907062852.GA1287@kroah.com>
References: <1473080592214136@kroah.com>
 <584a8fcd-6876-de0d-3c5e-8b4dad12c49d@synopsys.com>
 <20160906193810.GB22028@kroah.com>
 <7ab12d76-875a-c06f-08e3-ef628edda1b9@synopsys.com>
 <1e3ae422-d8ff-326e-29bd-b58002b5163b@synopsys.com>
 <20160907062852.GA1287@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <df4f96e8-fb05-ec81-6b32-ff6bc54ad853@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/06/2016 11:28 PM, Greg Kroah-Hartman wrote:
> On Tue, Sep 06, 2016@01:28:45PM -0700, Vineet Gupta wrote:
>> On 09/06/2016 01:22 PM, Vineet Gupta wrote:
>>>> Not "we need to support gcc6 for
>>>> old kernels", as really, if someone wants to update userspace, they
>>>> don't update their kernel?
>> FWIW, I'm not arguing for the backport inclusion - I'm just trying to explain the
>> context more.
>>
>> Thing is your regular user/customer don't really care/know about these details. So
>> there are tools bugs and more often than not the easy answer for tools providers
>> is "this is a known issue in gcc x.y which has been fixed in gcc x2.y2 so consider
>> upgrading". So it is for such class of users that having such backports makes life
>> a little easy.
> That's fine, but who would be upgrading their userspace gcc and then
> wanting to rebuild their kernel for an old kernel release? 

IMHO those are totally unrelated things. user-space gcc/tools upgrade can be
forced upon customers by processor vendors (us) saying new tools come with boat
load of fixes etc and more often that not it is indeed the case. OTOH, customers
typically like to lock into a specific kernel baseline for longish duration
because (1) they have out of tree drivers - (2) they have production systems,
where they would be iffy to change to a new kernel because prev one is stable etc.
I know above seem like made up points and it is easy to dismiss them given that
(1)  We don't really work our processes for "enabling" out of tree stuff and (2) a
new gcc is more unstable than a new kernel. But that is the mindset when you talk
to them.

>  What prevents them from also updating their kernel?

Their platform baseline and out of tree drivers. Given my experience with
maintaining arch port, in the past, an arch rebase has been easier than rebasing
the drivers because of the framework improvements, API changes....


> I understand the context, I'm just trying to say that this really is a
> "new feature" you are wanting here from what I can tell.  I'd recommend
> just having people upgrade their kernel :)

That's what I recommend them too, all the time, but forcing this with a tools
upgrade really enforces them and they need to pick a side, before 4.x or after 4.x
which is not nice....

Thx,
-Vineet

>
> thanks,
>
> greg k-h
>
